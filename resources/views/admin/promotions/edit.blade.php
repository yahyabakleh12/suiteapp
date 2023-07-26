@extends('layouts.master')

@section('title')
    Update Promotion
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
            Promotions
        @endslot
        @slot('title')
            Update promotion
        @endslot
    @endcomponent
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif


    <div class="row">

        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" action="{{ route('promotions.update', $promotion->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Name</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                        
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', $promotion->title) }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">subServices</label>
                                    <select class="form-control select2" name="subservice_id[]" multiple required>
                                        <option>Select</option>
                                        <?php $i = 0;
                                        $arr = [];
                                        ?>
                                        @foreach ($promotion->promotion_subservices as $item)
                                            <?php
                                            $arr[$i] = $item->subServices->id;
                                            $i++;
                                            ?>
                                        @endforeach

                                        @foreach ($subservices as $subservice)
                                        @if(in_array($subservice->id,$arr))
                                        <option value="{{ $subservice->id }}" selected>
                                            {{ $subservice->services->name }} - {{ $subservice->categories->name }} -
                                            {{ $subservice->name }}
                                        </option>
                                        @else
                                        <option value="{{ $subservice->id }}">
                                            {{ $subservice->services->name }} - {{ $subservice->categories->name }} -
                                            {{ $subservice->name }}
                                        </option>
                                        @endif
                                            
                                        @endforeach
                                    </select>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> discount</label>
                                    <input type="number" max="100" min='0'
                                        class="form-control @error('discount')
                                        
                                    @enderror"
                                        name="discount" id="validationCustom01" placeholder="discount"
                                        value="{{ old('discount', $promotion->discount) }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <img src="{{ $promotion->picture_url }}" alt="Avatar" class="" height="100px" width="100px">

                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">image</label>
                                    <input type="file" class="form-control @error('image')
                                    invalid
                                    @enderror" id="validationCustom02" placeholder="image" name="image"
                                    accept=".jpg,.png" >
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>


                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ route('categories.index') }}" class="btn"
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
