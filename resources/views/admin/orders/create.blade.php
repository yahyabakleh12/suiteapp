@extends('layouts.master')

@section('title')
    Create Order
@endsection
@section('css')
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
            Orders
        @endslot
        @slot('title')
            Create new order
        @endslot
    @endcomponent
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif


    <div class="row">

        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" action="{{ route('orders.store') }}" method="POST">
                        @csrf


                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">services</label>
                                    <select class="form-control select2" name="subservices[]" multiple>
                                        <option>Select</option>
                                        @foreach ($sub_services as $sub_service)
                                            <option value="{{ $sub_service->id }}">{{ $sub_service->name }} -
                                                {{ $sub_service->categories->name }} - {{ $sub_service->services->name }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">user</label>
                                    <select class="form-control select2" name="user_id">
                                        <option>Select</option>
                                        @foreach ($users as $user)
                                            
                                            <option value="{{ $user->id }}">{{ $user->name }} </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            {{-- <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">staff</label>
                                    <select class="form-control select2" name="staff_id">
                                        <option>Select</option>
                                        @foreach ($staffs as $staff)
                                            
                                            <option value="{{ $user->id }}">{{ $staff->name }} -
                                                {{ $staff->services->name }} </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div> --}}
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="form-label">where to find keys</label>
                                    <select class="form-control select2" name="key">
                                        <option>Select</option>
                                        <option value="locker">locker</option>
                                        <option value="collect">Collect it from Directly</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">status</label>
                                    <select class="form-control select2" name="status">
                                        <option>Select</option>
                                        <option value="1">waiting</option>
                                        <option value="2">approved</option>
                                        <option value="3">rejected</option>

                                    </select>
                                </div>
                            </div>
                            {{-- <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">staff count</label>
                                    <select class="form-control select2" name="status">
                                        <option>Select</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div> --}}
                        </div>

                        <div class="row"></div>

                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ route('orders.index') }}" class="btn"
                            style="background-color: gray;color:white">cancel</a>
                </div>
                </form>
            </div>
        </div>
        <!-- end card -->
    </div> <!-- end col -->


    </div>
    <!-- end row -->
@endsection
@section('script')
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
