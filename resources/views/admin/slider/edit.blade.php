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
                                    <label for="validationCustom01" class="form-label">building name</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                    invalid
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', $building->name) }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">location</label>
                                    <input type="text"
                                        class="form-control @error('location')
                                    invalid
                                    @enderror"
                                        id="validationCustom02" placeholder="Location" name="location"
                                        value="{{ old('location', $building->location) }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">area</label>
                                    <select class="form-control select2" name="area_id">
                                        <option value="{{ $building->area_id }}">{{ $building->area->name }}</option>
                                        @foreach ($area as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Services</label>
                                    <select class="form-control select2" name="services[]" multiple>
                                      
                                        <?php
                                        $i = 0;
                                        $arr = []; ?>
                                        @foreach ($building->building_services as $obj)
                                            <option value="{{ $obj->services->id }}" selected>
                                                {{ $obj->services->name }}
                                            </option>
                                            <?php
                                            $arr[$i] = $obj->services->id;
                                            $i++
                                            ?>
                                        @endforeach
                                        @foreach ($services as $item)
                                        @if(!in_array($item->id ,$arr))
                                            <option value="{{ $item->id }}">{{ $item->name }}
                                            </option>
                                            @endif
                                        @endforeach

                                    </select>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="mt-4">
                                    <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                        <input name="parkonic_residantial" class="form-check-input" type="checkbox"
                                            id="customCheckcolor1" @if ($building->parkonic_residantial == 1) checked @endif>
                                        <label class="form-check-label" for="customCheckcolor1">
                                            parkonic residantial
                                        </label>
                                    </div>
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
