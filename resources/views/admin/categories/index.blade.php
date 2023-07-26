@extends('layouts.master')
@section('title')
    Categories
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
            Categories
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
                <a href="{{ route('categories.create') }}"
                    class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i class="mdi mdi-plus me-1"></i>
                    Add New category</a>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Discription</th>
                                <th>Frequencies</th>
                                <th>Time slotes</th>
                                <th>multipale_staff</th>
                                <th>staff_price</th>
                                <th>multipale_houres</th>
                                <th>hour_price</th>
                                <th>is_meterial</th>
                                <th>meterial_price</th>
                                <th>is_gender</th>
                                <th>picture</th>
                                <th>price</th>
                                <th>Action</th>
                            </tr>
                        </thead>


                        <tbody>
                           
                            @foreach($categories as $category)
                            {{-- {{dd($categories)}} --}}
                                <tr>
                                    <td>{{ $category->services->name }} -> {{ $category->name }}</td>
                                    <td>
                                        @foreach ($category->discription as $item)
                                            <span class="text-success"><i class="bx bx-check-square "></i></span>
                                            {{ $item }}<br>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach ($category->frequency as $obj)
                                        <span class="badge badge-pill badge-soft-dark font-size-14">
                                            {{$obj->title}}
                                        </span>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach ($category->time_slote as $item1)
                                            <span class="text-info"><i class="bx bx-time "></i></span>
                                            {{ $item1 }}<br>
                                        @endforeach
                                    </td>
                                    <td> @if ($category->multipale_staff == 0)
                                        <span class="badge badge-pill badge-soft-danger font-size-12"> No</span>
                                        @else
                                        <span class="badge badge-pill badge-soft-success font-size-12"> Yes</span>
    
                                        @endif</td>
                                    <td>
                                        {{ $category->staff_price }}
                                    </td>
                                    <td> @if ($category->multipale_houres == 0)
                                        <span class="badge badge-pill badge-soft-danger font-size-12"> No</span>
                                        @else
                                        <span class="badge badge-pill badge-soft-success font-size-12"> Yes</span>
    
                                        @endif</td>
                                    <td>{{ $category->hour_price }}</td>
                                    <td> @if ($category->is_meterial == 0)
                                        <span class="badge badge-pill badge-soft-danger font-size-12"> No</span>
                                        @else
                                        <span class="badge badge-pill badge-soft-success font-size-12"> Yes</span>
    
                                        @endif</td>
                                    <td>{{ $category->meterial_price }}</td>
                                     <td> @if ($category->is_gender == 0)
                                        <span class="badge badge-pill badge-soft-danger font-size-12"> No</span>
                                        @else
                                        <span class="badge badge-pill badge-soft-success font-size-12"> Yes</span>
    
                                        @endif</td>
                                    <td><a href="{{ url($category->picture_path) }}" target="_blank"><img
                                                src="{{ url($category->picture_path) }}" alt="category picture"
                                                height="50px" width="50px"></a></td>
                                                <td>
                                                    {{$category->price}}
                                                </td>
                                    <td>
                                        <a href="{{ route('categories.edit', $category->id) }}"
                                            class="btn btn-warning">Edit</a>
                                        <form action="{{ route('categories.destroy', $category->id) }}" method="post"
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
