@extends('layouts.master')
@section('title')
    Promotions
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
            Promotions
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
                <a href="{{ route('promotions.create') }}"
                    class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i class="mdi mdi-plus me-1"></i>
                    Add New promotion</a>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>picture</th>
                                <th>percent</th>
                                <th>Total Price </th>
                                <th>
                                    sub services
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($promotions as $promotion)
                                <tr>
                                    <td>{{ $promotion->title }}</td>
                                    <td><a href="{{ url($promotion->picture_path) }}" target="_blank"><img
                                                src="{{ url($promotion->picture_path) }}" alt="promotion picture" height="50px"
                                                width="50px"></a></td>
                                    <td>{{ $promotion->discount }}%</td>


                                    <td>{{ $promotion->total_price }} AED</td>
                                    <td>
                                        @foreach ($promotion->promotion_subservices as $item)
                                            <span class="btn btn-primary m-1 p-2">{{ $item->subServices->services->name }} -{{ $item->subServices->categories->name }}- {{ $item->subServices->name }}
                                                {{ $item->price }} AED</span><br>
                                        @endforeach
                                    </td>
                                    <td>
                                        <a href="{{ route('promotions.edit', $promotion->id) }}"
                                            class="btn btn-warning">Edit</a>
                                        <form action="{{ route('promotions.destroy', $promotion->id) }}" method="post"
                                            style="display: inline">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm"
                                                data-toggle="tooltip" title='Delete'>Delete</button>

                                        </form>
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
