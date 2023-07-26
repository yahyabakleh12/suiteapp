@extends('layouts.master')

@section('title')
    Users Log
@endsection

@section('css')
    <!-- DataTables -->
    <link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Dashboard
        @endslot
        @slot('title')
            users log
        @endslot
    @endcomponent
    @if (Session::has('success'))
        <div class="alert alert-success">
            {{ Session::get('success') }}
        </div>
    @endif
    @if (Session::has('fail'))
        <div class="alert alert-danger">
            {{ Session::get('fail') }}
        </div>
    @endif

    <!--  end row -->
    <form action="">
        <div class="row p-2">

            <div class="col-2">
                <div class="mb-3">

                    <input type="text" class="form-control @error('Resident')
            invalid
            @enderror"
                        name="username" id="validationCustom01" placeholder="Resident" value="">
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>




            </div>
            <div class="col-2">

                <div class="mb-3">

                    <input type="text" class="form-control @error('Building')
            invalid
            @enderror"
                        name="building" id="validationCustom01" placeholder="Building" value="">
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>


            </div>

           
            <div class="col-2">
                <div class="mb-3">

                    <input type="text" class="form-control @error('appartment')
            invalid
            @enderror"
                        name="appartment" id="validationCustom01" placeholder="Appartment" value="">
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>

            </div>
            <div class="col-2">
                <div class="mb-3">

                    <input type="text" class="form-control @error('guest')
            invalid
            @enderror"
                        name="guest" id="validationCustom01" placeholder="Guest" value="">
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>


            </div>

            <div class="col-2">
                <div class="mb-3">

                    <input type="text" class="form-control @error('guest_type')
            invalid
            @enderror"
                        name="guest_type" id="validationCustom01" placeholder="Guest Type" value="">
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>

            </div>
            <div class="col-2">
                <input type="submit" value="Search" class="btn btn-primary">  
                <input type="submit" value="Archive" class="btn btn-dark">
                <input type="submit" value="EXCEL" class="btn btn-success">
                {{-- <a href=""></a> --}}
            </div>


        </div>
    </form>
    <div class="row">

        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>User Name</th>
                                <th>Building</th>
                                <th>Facility</th>
                                <th>time and Date</th>
                                <th>User apartment</th>
                                <th>User email</th>
                                <th>User phone</th>
                                <th>Is Guest</th>
                                <th>Guest Name</th>
                                <th>Guest Email</th>
                                <th>Guest Phone</th>
                                <th>Guest Type</th>
                            </tr>
                        </thead>


                        <tbody>

                            @foreach ($logs as $log)
                                {{-- {{dd($log)}} --}}
                                @if (!empty($log))
                                    <tr>
                                        <td>{{ $log->User->name }}</td>
                                        <td>Murjan 2</td>
                                        <td>{{ $log->facility_services->name }}</td>
                                        <td>{{ $log->created_at }}</td>
                                        <td>{{ $log->User->appartment_number }}</td>
                                        <td>{{ $log->User->email }}</td>
                                        <td>{{ $log->User->phone }}</td>
                                        <td>
                                            @if ($log->is_guest == 1)
                                                <span class="badge badge-pill badge-soft-success font-size-16">Yes</span>
                                            @else
                                                <span class="badge badge-pill badge-soft-danger font-size-16">No</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if ($log->is_guest == 1)
                                                {{ $log->guest->name }}
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td>
                                            @if ($log->is_guest == 1)
                                                {{ $log->guest->email }}
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td>
                                            @if ($log->is_guest == 1)
                                                {{ $log->guest->phone }}
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td>
                                            @if ($log->is_guest == 1)
                                                {{ $log->guest->type }}
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                    </tr>
                                @endif
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- end col -->
    </div> <!-- end row -->

    <!-- end row -->
@endsection
@section('script')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script type="text/javascript">
        $('.show_confirm').click(function(event) {
            var form = $(this).closest("form");
            var name = $(this).data("name");
            event.preventDefault();
            swal({
                    title: `Are you sure you want to delete this record?`,
                    text: "if you delete this, it will affect other information on the system and may cause to delete them.  ",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
        });
    </script>
    <!-- Required datatable js -->
    <script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
    <!-- Datatable init js -->
    <script src="{{ URL::asset('/assets/js/pages/datatables.init.js') }}"></script>
@endsection
