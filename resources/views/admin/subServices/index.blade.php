@extends('layouts.master')

@section('title')
    subService
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
            subServices
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
        <div class="col-12">
            <div class="text-sm-end">
                <a href="{{ route('subServices.create') }}"
                    class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i class="mdi mdi-plus me-1"></i>
                    Add New subService</a>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                              
                                <th>Name</th>
                                <th>price</th>
                                {{-- <th>category</th>
                                <th>service</th> --}}
                                <th>Time slot</th>
                                <th>
                                    discount starts at
                                </th>
                                <th>
                                    discount ends at
                                </th>
                                <th>
                                    discount
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($subServices as $subService)
                                <tr>
                                    
                                    <td>{{ $subService->services->name }} -> {{ $subService->categories->name }} -> {{ $subService->name }}</td>
                                    <td>{{ $subService->price }} AED</td>
                                    {{-- <td>{{ $subService->categories->name }}</td>
                                    <td>{{ $subService->services->name }}</td> --}}
                                    <td>
                                        @foreach ($subService->time_slote_subservices as $item)
                                        <span class="badge badge-pill badge-soft-dark font-size-14"> {{ $item->time_slote->time_from }} - {{ $item->time_slote->time_to }}</span><br><br>
                                        @endforeach

                                    </td>
                                    <td>
                                        <span class="badge badge-pill badge-soft-success font-size-20">
                                            {{ $subService->promotion_from }}</span>
                                    </td>
                                    <td> <span class="badge badge-pill badge-soft-warning font-size-20">
                                            {{ $subService->promotion_to }}</span>
                                    </td>
                                    <td>
                                        <span class="badge badge-pill badge-soft-primary font-size-20">
                                        {{ $subService->discount }} %
                                        </span></td>

                                    <td>
                                        <a href="{{ route('subServices.edit', $subService->id) }}"
                                            class="btn btn-warning">edit</a>
                                        <form action="{{ route('subServices.destroy', $subService->id) }}" method="post"
                                            style="display: inline">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm"
                                                data-toggle="tooltip" title='Delete'>Delete</button>
                                        </form>
                                        {{-- <button class="btn btn-danger" id="delete">Delete</button> --}}
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
