@extends('layouts.master')

@section('title')
    Facilities
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
            Facilities
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
                                <th> Opening Time</th>
                                <th>Closing Time</th>
                                <th>Access Type</th>
                                <th>Building</th>
                                <th>Access Sharing Availability</th>
                                <th>Duration</th>
                                <th>status</th>
                                <th>Action</th>
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($facilities as $item)
                                <tr>
                                    <td>{{ $item->name }}</td>
                                    <td>
                                        @if($item->start == null)
                                        
                                        <span class="badge badge-pill badge-soft-primary font-size-14">  N/A </span>
                                           
                                           @else
                                           <span class="badge badge-pill badge-soft-primary font-size-14"> {{ $item->start }}</span>
                                           
                                           @endif
                                        
                                        
                                       </td>
                                    <td>@if($item->end == null)
                                        
                                        <span class="badge badge-pill badge-soft-primary font-size-14">  N/A </span>
                                           
                                           @else
                                           <span class="badge badge-pill badge-soft-primary font-size-14"> {{ $item->end }}</span>
                                           
                                           @endif</td>
                                          
                                    <td>
                                        @if ($item->is_all_time == 1)
                                            <span class="badge badge-pill badge-soft-success font-size-14">without time restriction</span>
                                        @elseif($item->is_booking == 1)
                                            <span class="badge badge-pill badge-soft-danger font-size-14">with a time restriction, pre-booking, and time-schedule</span>
                                        @else
                                            <span class="badge badge-pill badge-soft-warning font-size-14">with time restriction</span>
                                        @endif
                                    </td>
                                    <td>Murjan 2</td>
                                    <td>
                                        @if ($item->sharing == 1)
                                            <span class="badge badge-pill badge-soft-success font-size-14">YES</span>
                                        @else
                                            <span class="badge badge-pill badge-soft-danger font-size-14">No</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if($item->duration == null)
                                        
                                     <span class="badge badge-pill badge-soft-info font-size-14">  N/A </span>
                                        
                                        @else
                                        <span class="badge badge-pill badge-soft-info font-size-14"> {{ $item->duration }}</span>
                                        
                                        @endif
                                        
                                    </td>

                                    <td>
                                        {{-- @if($item->duration == null) --}}
                                        
                                     <span class="badge badge-pill badge-soft-danger font-size-14">  Off </span>
                                        
                                        {{-- @else --}}
                                        {{-- <span class="badge badge-pill badge-soft-info font-size-14"> {{ $item->duration }}</span> --}}
                                        
                                        {{-- @endif --}}
                                        
                                    </td>
                                    <td>
                                      
                                            <a href="{{ route('facility.edit', $item->id) }}" class="btn btn-warning">Edit
                                            </a>
                                            <a href="{{ route('facility.edit', $item->id) }}" class="btn btn-info">Log
                                            </a>
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
