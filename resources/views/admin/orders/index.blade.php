@extends('layouts.master')

@section('title')
    Orders
@endsection
@section('css')
    <!-- Lightbox css -->
    <link href="{{ URL::asset('/assets/libs/magnific-popup/magnific-popup.min.css') }}" rel="stylesheet" type="text/css" />

    <!-- DataTables -->
    <link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ URL::asset('/assets/libs/select2/select2.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ URL::asset('/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.css') }}" rel="stylesheet"
        type="text/css">
    <link href="{{ URL::asset('/assets/libs/spectrum-colorpicker/spectrum-colorpicker.min.css') }}" rel="stylesheet"
        type="text/css">
    <link href="{{ URL::asset('/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.css') }}" rel="stylesheet"
        type="text/css">
    <link href="{{ URL::asset('/assets/libs/bootstrap-touchspin/bootstrap-touchspin.min.css') }}" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" href="{{ URL::asset('/assets/libs/datepicker/datepicker.min.css') }}">
@endsection
@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Dashboard
        @endslot
        @slot('title')
            Orders
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
                <a href="{{ route('buildings.create')}}"
                    class="btn btn-primary btn-rounded waves-effect waves-light mb-2 me-2"><i
                        class="mdi mdi-plus me-1"></i> Add New building</a>
            </div>
        </div> --}}
        <div class="col-12">
            <div class="card">
                <div class="card-body">


                    <table id="datatable-buttons" class="table text-center  table-bordered dt-responsive nowrap w-100">
                        <thead>
                            <tr>
                                <th>created at</th>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Service</th>
                                {{-- <th>category</th>
                                <th>SubService</th> --}}
                                <th>Total Price</th>
                                <th>number of orders </th>
                                <th>Payment Status</th>
                                <th>type</th>
                                {{-- <th>Reference Number</th> --}}
                                {{-- <th>Staff</th>
                                <th>booking date & time(24h base)</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>


                        <tbody>
                            @foreach ($orders as $order)
                                <tr>
                                    <td>{{$order->created_at}}</td>
                                    <td><a href="#"> #{{ $order->special_number }}</a></td>
                                    <td>{{ $order->User->name }}</td>
                                    <td>{{ $order->services->name }}</td>
                                    {{-- <td>
                                        @foreach ($order->order_detail as $item)
                                            {{ $item->categories->name }}
                                        @endforeach

                                    </td>
                                    <td>
                                        @foreach ($order->order_detail as $item)
                                            {{ $item->subServices->name }}
                                        @endforeach

                                    </td> --}}
                                    <td>{{ $order->total_price }} AED</td>
                                    <td>{{ count($order->order_detail) }}</td>
                                    {{-- <td>{{ $order->subServices->name }}</td> --}}

                                    {{-- <td class="text-center">
                                        @foreach ($order->order_detail as $item)
                                        @endforeach
                                    </td> --}}
                                    <td>


                                        @if ($order->payment_status == 1)
                                            <span class="badge badge-pill badge-soft-success font-size-12"> Approved</span>
                                        @elseif($order->payment_status == 2)
                                            <span class="badge badge-pill badge-soft-danger font-size-12"> Revoked</span>
                                        @elseif($order->payment_status == 3)
                                            <span class="badge badge-pill badge-soft-primary font-size-12"> completed</span>
                                        @else
                                            <span class="badge badge-pill badge-soft-dark font-size-12"> Pending</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if($order->is_promotion == 1)
                                        <span class="badge badge-pill badge-soft-primary font-size-12">Promotion</span>
                                        @else
                                        <span class="badge badge-pill badge-soft-dark font-size-12">  Regular </span>
                                       @endif
                                    </td>


                                    <td>
                                        {{-- <a href="{{ route('orders.edit', $order->id) }}" class="btn btn-warning">edit</a> --}}
                                        <form action="{{ route('orders.destroy', $order->id) }}" method="post"
                                            style="display: inline">
                                            @csrf
                                            @method('delete')
                                            <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm"
                                                data-toggle="tooltip" title='Delete'>Delete</button>

                                        </form>
                                        <hr>
                                        <div class="mt-2">
                                            <a class="popup-form btn btn-success" href="#details_{{ $order->id }}"><i
                                                    class="bx bx-info-circle me-1"></i>Details</a>
                                        </div>

                                        <div class="card mfp-hide mfp-popup-form mx-auto" id="details_{{ $order->id }}">
                                            <div class="card-body p-5">
                                                <h4 class="mt-0 mb-4">Order Details for <span
                                                        class="badge badge-pill badge-soft-dark font-size-18">
                                                        #{{ $order->special_number }}</span>
                                                </h4>

                                                @foreach ($order->order_detail as $item)
                                                    <table class="table table-dark table-striped p-5">
                                                        <tbody>
                                                            <tr>
                                                                <td>Cusrtomer Name : </td>
                                                                <td> {{ $order->User->name }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>SubService :</td>
                                                                <td> {{ $item->subServices->name }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Category :</td>
                                                                <td>{{ $item->categories->name }}</td>

                                                            </tr>
                                                            <tr>
                                                                <td>Service item Type :</td>
                                                                <td>{{ $order->services->item_type }}</td>

                                                            </tr>
                                                            @if ($order->services->item_type == 'car')
                                                                <tr>

                                                                    <td> car type : </td>
                                                                    <td>{{ $item->cars->type }} </td>

                                                                </tr>
                                                                <tr>
                                                                    <td> plate number :</td>
                                                                    <td>{{ $item->cars->plate_number }}</td>
                                                                </tr>
                                                            @else
                                                                <tr>
                                                                    <td> Appartment number :</td>
                                                                    <td> {{ $order->User->appartment_number }}</td>
                                                                </tr>
                                                            @endif
                                                            <tr>
                                                                <td>Payment Refrence Number </td>
                                                                <td>
                                                                    @if ($order->reference_number == null)
                                                                        <span
                                                                            class="badge badge-pill badge-soft-warning font-size-16">Not

                                                                            Recived Yet</span>
                                                                    @else
                                                                        {{ $order->reference_number }}
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Status :
                                                                </td>
                                                                <td>
                                                                    @if ($item->status == 0)
                                                                        <span
                                                                            class="badge badge-pill badge-soft-dark font-size-12">
                                                                            Pending</span><br>
                                                                        <hr>
                                                                        <a href="{{ route('revoke.order', $order->id) }}"
                                                                            class="btn btn-danger m-2">Revoke</a>
                                                                        <a href="{{ route('accept.order', $order->id) }}"
                                                                            class="btn btn-success m-2">Approve</a>
                                                                    @elseif($item->status == 1)
                                                                        <span
                                                                            class="badge badge-pill badge-soft-success font-size-12">
                                                                            Approved</span>
                                                                    @elseif($item->status == 2)
                                                                        <span
                                                                            class="badge badge-pill badge-soft-danger font-size-12">
                                                                            Revoked</span>
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Staff :</td>
                                                                <td>
                                                                    @if (!$item->staff_id)
                                                                        <form class="needs-validation"
                                                                            action="{{ route('staff.add.order') }}"
                                                                            method="POST">
                                                                            @csrf
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <div class="mb-3">
                                                                                        <label for="validationCustom01"
                                                                                            class="form-label">
                                                                                            Name</label>
                                                                                        <select name="staff_id"
                                                                                            class="form-control select2">
                                                                                            @foreach ($order->services->staff as $obj)
                                                                                                <option
                                                                                                    value="{{ $obj->id }}">
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

                                                                            <input type="text" name="order_detail_id"
                                                                                value="{{ $item->id }}"
                                                                                style="display: none">
                                                                            <button class="btn btn-primary"
                                                                                type="submit">save</button>


                                                                        </form>
                                                                    @else
                                                                        {{ $item->staff->name }}
                                                                    @endif

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Time Slote :</td>
                                                                <td>
                                                                    @foreach ($item->order_date_time as $obj)
                                                                    <span
                                                                    class="badge badge-pill badge-soft-primary font-size-14">
                                                                    {{ $obj->date }} </span> <span
                                                                    class="badge badge-pill badge-soft-success font-size-14">{{ $obj->time_from }} -> {{ $obj->time_to }}</span> <br><br>   
                                                                    @endforeach
                                                                    
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                @endforeach


                                            </div>
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
    <!-- Magnific Popup-->
    <script src="{{ URL::asset('/assets/libs/magnific-popup/magnific-popup.min.js') }}"></script>

    <!-- lightbox init js-->
    <script src="{{ URL::asset('/assets/js/pages/lightbox.init.js') }}"></script>
    <!-- Required datatable js -->
    <script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
    <!-- Datatable init js -->
    <script src="{{ URL::asset('/assets/js/pages/datatables.init.js') }}"></script>


    <script src="{{ URL::asset('/assets/libs/select2/select2.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/spectrum-colorpicker/spectrum-colorpicker.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/bootstrap-touchspin/bootstrap-touchspin.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/datepicker/datepicker.min.js') }}"></script>
    <!-- form advanced init -->
    <script src="{{ URL::asset('/assets/js/pages/form-advanced.init.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/parsleyjs/parsleyjs.min.js') }}"></script>

    <script src="{{ URL::asset('/assets/js/pages/form-validation.init.js') }}"></script>
@endsection
