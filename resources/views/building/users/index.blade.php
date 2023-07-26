@extends('layouts.master')

@section('title')
Residents
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
        Residents
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
    <div class="row">
        {{-- <div class="col-12">
            <div class="text-sm-end">
                <a href="{{ route('users.create') }}"
                    class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i class="bx bx-block me-1"></i>
                    block user</a>
            </div>
        </div> --}}
        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>email</th>
                                <th>phone</th>
                                <th>apartment</th>
                                <th>Status</th>
                                <th>Restriction</th>
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($users as $user)
                                <tr>
                                    <td>{{ $user->name }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td>{{ $user->phone }}</td>
                                    <td>{{ $user->appartment_number }}</td>
                                    <td>
                                        @if ($user->active == 1)
                                            <span class="badge badge-pill badge-soft-success font-size-16">Active</span>
                                        @else
                                            <form action="{{ route('building.activate.user', $user->id) }}"
                                                style="display:inline" method="post">
                                                @csrf
                                                @method('PUT')
                                                <button class="btn btn-warning" type="submit">
                                                    activate</button>
                                            </form>
                                        @endif
                                    </td>
                                    <td>

                                        <div>
                                            <button type="button" class="btn btn-primary waves-effect waves-light"
                                                data-bs-toggle="modal"
                                                data-bs-target=".bs-example-modal-center-{{ $user->id }}">Facility
                                                Restriction</button>

                                            <div class="modal fade bs-example-modal-center-{{ $user->id }}"
                                                tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Facility Restriction</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                        </div>
                                                        @php
                                                            $arr = [];
                                                            $i = 0;
                                                        @endphp
                                                        <div class="modal-body">
                                                            @foreach ($user->user_facility_bloking as $item)
                                                                @php
                                                                    $arr[$i] = $item->facility_id;
                                                                    $i++;
                                                                @endphp
                                                            @endforeach
                                                           
                                                            @foreach ($facilities as $obj)
                                                                @if (in_array($obj->id, $arr))
                                                                    <div class="row m-3 bg-danger p-2 rounded">
                                                                    @else
                                                                        <div class="row m-3 bg-primary p-2 rounded">
                                                                @endif

                                                                <div class="col-6">

                                                                    <h4 class="text-light">{{ $obj->name }}
                                                                    </h4>


                                                                </div>
                                                                <div class="col-6 d-flex justify-content-end">
                                                                    @if (in_array($obj->id, $arr))
                                                                        <form
                                                                            action="{{ route('building.unrestrict.user', $user->id) }}"
                                                                            style="display:inline" method="post">
                                                                            @csrf
                                                                            @method('PUT')
                                                                            <input type="text" name="facility_service_id"
                                                                                value="{{ $obj->id }}" hidden>
                                                                            <button type="submit"
                                                                                class="btn btn-primary">unrestrict</button>
                                                                        </form>
                                                                    @else
                                                                        <form
                                                                            action="{{ route('building.restrict.user', $user->id) }}"
                                                                            style="display:inline" method="post">
                                                                            @csrf
                                                                            @method('PUT')
                                                                            <input type="text" name="facility_service_id"
                                                                                value="{{ $obj->id }}" hidden>
                                                                            <button type="submit"
                                                                                class="btn btn-danger">Restrict</button>
                                                                        </form>
                                                                    @endif
                                                                </div>
                                                        </div>
                            @endforeach

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    </div>




    </td>
    </tr>
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
