@extends('layouts.master')

@section('title')
    All - Orders
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
        All - Orders
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
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>created at</th>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Purches</th>
                                <th>Item</th>
                                <th>status</th>
                                <th>Staff</th>
                                <th>dates & times</th>
                                <th>price</th>
                                {{-- <th>Action</th> --}}
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($details as $item)
                                <tr>
                                    <td>{{ $item->created_at}}</td>
                                    <td><a href="#"><b> # {{ $item->orders->special_number }}</b></a></td>
                                    <td>{{ $item->orders->User->name }}</td>
                                    <td> {{ $item->orders->services->name }} -> {{ $item->categories->name }} ->
                                        {{ $item->subServices->name }}</td>
                                    @if ($item->orders->services->item_type == 'car')
                                        <td>{{ $item->cars->type }} - {{ $item->cars->plate_number }}</td>
                                    @else
                                        <td> {{ $item->orders->User->appartment_number }}</td>
                                    @endif
                                    <td>
                                        @if ($item->status == 0)
                                            <span class="badge badge-pill badge-soft-dark font-size-12">
                                                Pending</span><br>
                                            <hr>
                                            <a href="{{ route('revoke.order', $item->orders->id) }}"
                                                class="btn btn-danger m-2">Revoke</a>
                                            <a href="{{ route('accept.order', $item->orders->id) }}"
                                                class="btn btn-success m-2">Approve</a>
                                        @elseif($item->status == 1)
                                            <span class="badge badge-pill badge-soft-success font-size-12">
                                                Approved</span>
                                        @elseif($item->status == 2)
                                            <span class="badge badge-pill badge-soft-danger font-size-12">
                                                Revoked</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if (!$item->staff_id)
                                            <form class="needs-validation" action="{{ route('staff.add.order') }}"
                                                method="POST">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="validationCustom01" class="form-label">
                                                                Name</label>
                                                            <select name="staff_id" class="form-control select2">
                                                                @foreach ($item->orders->services->staff as $obj)
                                                                    <option value="{{ $obj->id }}">
                                                                        {{ $obj->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <input type="text" name="order_detail_id" value="{{ $item->id }}"
                                                    style="display: none">
                                                <button class="btn btn-primary" type="submit">save</button>


                                            </form>
                                        @else
                                            {{ $item->staff->name }}
                                        @endif

                                    </td>
                                    <td>
                                        @foreach ($item->order_date_time as $obj)
                                       
                                            <span
                                                class="badge badge-pill badge-soft-primary font-size-14">
                                                {{ $obj->date }} </span> <span
                                                class="badge badge-pill badge-soft-success font-size-14">{{ $obj->time_from }} -> {{$obj->time_to}}</span><br><br>
                                     
                                        @endforeach
                                    </td>
                                    <td>
                                        {{$item->price}}
                                    </td>
                                    {{-- <td>
                                        <a href="{{ route('area.edit', $item->id) }}" class="btn btn-warning">edit</a>
                                        <form action="{{ route('area.destroy', $item->id) }}" method="post"
                                            style="display: inline">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm"
                                                data-toggle="tooltip" title='Delete'>Delete</button>
                                        </form>
                                    </td> --}}
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
