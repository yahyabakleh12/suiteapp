@extends('layouts.master')

@section('title')
    Edit Building
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
            Buildings
        @endslot
        @slot('title')
            Edit buiulding
        @endslot
    @endcomponent
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif


    <div class="row">

        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" action="{{ route('buildings.update', $building->id) }}" method="POST">
                        @csrf
                        @method('put')
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Title</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                    invalid
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> number of dates</label>
                                    <input type="number"
                                        class="form-control @error('number_of_dates')
                                    invalid
                                    @enderror"
                                        name="number_of_dates" id="validationCustom01" placeholder="number of dates"
                                        value="{{ old('number_of_dates', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mt-4">
                                    <h5 class="font-size-14 mb-4">Frequency</h5>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="radio" name="frequency" id="formRadios1"
                                            value="daily">
                                        <label class="form-check-label" for="formRadios1">
                                            Daily
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="radio" name="frequency" id="formRadios2"
                                            value="weekly">
                                        <label class="form-check-label" for="formRadios2">
                                            Weekly
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="radio" name="frequency" id="formRadios2"
                                            value="monthly" checked>
                                        <label class="form-check-label" for="formRadios2">
                                            Monthly
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            @foreach ($plan as $item)
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label class="form-label">{{$item->name }} price</label>
                                        <input type="number" class="form-control" step="0.01" value="0" name="plan_{{$item->id}}">
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Services</label>
                                    <select class="form-control select2" name="service">
                                        <option>select</option>
                                        @foreach ($services as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ route('buildings.index') }}" class="btn"
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
