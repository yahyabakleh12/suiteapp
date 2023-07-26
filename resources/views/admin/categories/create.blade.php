@extends('layouts.master')

@section('title')
    Create category
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
            categories
        @endslot
        @slot('title')
            Create new category
        @endslot
    @endcomponent
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif


    <div class="row">

        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation outer-repeater"action="{{ route('categories.store') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Name</label>
                                    <input type="text"
                                        class="form-control @error('name')
                                        
                                    @enderror"
                                        name="name" id="validationCustom01" placeholder="name"
                                        value="{{ old('name', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">service</label>
                                    <select class="form-control select2" name="service_id">
                                        <option>Select</option>
                                        @foreach ($services as $service)
                                            <option value="{{ $service->id }}">{{ $service->name }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>



                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> Base Price For Category</label>
                                    <input type="text"
                                        class="form-control @error('price')
                                        
                                    @enderror"
                                        name="price" id="validationCustom01" placeholder="Base Price"
                                        value="{{ old('price', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="validationCustom02" class="form-label">image</label>
                                    <input type="file"
                                        class="form-control @error('image')
                                    invalid
                                    @enderror"
                                        id="validationCustom02" placeholder="image" name="image" accept=".jpg,.png,.jpeg"
                                        required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="mt-4">
                                    <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                        <input name="multipale_houres" class="form-check-input" type="checkbox"
                                            id="customCheckcolor1" checked>
                                        <label class="form-check-label" for="customCheckcolor1">
                                            multibule hours
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> price for hour (AED)</label>
                                    <input type="number"
                                        class="form-control @error('hour_price')
                                            
                                        @enderror"
                                        name="hour_price" id="validationCustom01" placeholder="hour_price"
                                        value="{{ old('hour_price', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mt-4">
                                    <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                        <input name="meterial" class="form-check-input" type="checkbox"
                                            id="customCheckcolor2" checked>
                                        <label class="form-check-label" for="customCheckcolor2">
                                            meterial
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> price for meterial (AED)</label>
                                    <input type="number"
                                        class="form-control @error('meterial_price')
                                            
                                        @enderror"
                                        name="meterial_price" id="validationCustom01" placeholder="meterial_price"
                                        value="{{ old('meterial_price', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="mt-4">
                                    <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                        <input name="multipale_staff" class="form-check-input" type="checkbox"
                                            id="customCheckcolor3" checked>
                                        <label class="form-check-label" for="customCheckcolor3">
                                            multipale staff
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label"> price for Staff (AED)</label>
                                    <input type="number"
                                        class="form-control @error('staff_price')
                                            
                                        @enderror"
                                        name="staff_price" id="validationCustom01" placeholder="staff_price"
                                        value="{{ old('staff_price', '') }}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mt-4">
                                    <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                        <input name="is_gender" class="form-check-input" type="checkbox"
                                            id="customCheckcolor4" checked>
                                        <label class="form-check-label" for="customCheckcolor4">
                                            Saff gender choose
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}

                        <div class="row">
                            <div class="col-6 " id="description_row">
                                <section class="bg-primary rounded p-3 m-3">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="validationCustom02 "
                                                class="form-label text-light">Description</label>
                                            <input type="text" class="form-control" id="validationCustom02"
                                                placeholder="Description" name="addmordescription[0]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 ">
                                        <div class="mt-4 mb-3 d-flex justify-content-center">

                                            <button class="btn btn-success" style="width: 33%" id="add_des"
                                                type="button">
                                                Add</button>
                                        </div>
                                    </div>

                                </section>
                            </div>
                            {{-- ----------------------------------------------------------------------------------------------------- --}}
                            {{-- ----------------------------------------------------------------------------------------------------- --}}
                            {{-- ----------------------------------------------------------------------------------------------------- --}}
                            {{-- ----------------------------------------------------------------------------------------------------- --}}
                            {{-- ----------------------------------------------------------------------------------------------------- --}}


                            <div class="col-6" id="timeslote_row">
                                <section class=" rounded p-3 m-3" style="background-color: #c1c1c1">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label for="validationCustom02 " class="form-label text-light">Time
                                                slote</label>
                                            <input type="time" class="form-control" id="validationCustom02"
                                                placeholder="Time slote" name="timeslote[0]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="mt-4 mb-3  d-flex justify-content-center">

                                            <button class="btn btn-success" style="width: 33%" id="add_timeslote"
                                                type="button">
                                                Add</button>
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </div>








                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}

                        <div class="row mb-3" id="frequency_row">
                            <h2 class="text-center p-3 bg-primary text-light rounded">Frequency</h2>
                            <section class="bg-dark rounded p-3 mt-3" style="width:100%;">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="validationCustom02 " class="form-label text-light">Title</label>
                                            <input type="text" class="form-control" id="validationCustom02"
                                                placeholder="Title" name="frequency[0][title]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="validationCustom02 "
                                                class="form-label text-light">Description</label>
                                            <input type="text" class="form-control" id="validationCustom02"
                                                placeholder="Description" name="frequency[0][description]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="validationCustom02 " class="form-label text-light">Number of
                                                dates</label>
                                            <input type="number" class="form-control" id="validationCustom02"
                                                placeholder="Number of dates" name="frequency[0][number_of_dates]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="validationCustom02 " class="form-label text-light">Price</label>
                                            <input type="number" class="form-control" id="validationCustom02"
                                                placeholder="Price in AED" name="frequency[0][price]">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mt-4 mb-3  d-flex justify-content-center">

                                            <button class="btn btn-success" style="width: 33%" id="add_freq"
                                                type="button">
                                                Add</button>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>



                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}
                        {{-- ----------------------------------------------------------------------------------------------------- --}}



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
    <script>
        var i = 0;

        $("#add_des").click(function() {

            ++i;

            $("#description_row").append(
                '  <section class="bg-primary rounded p-3 m-3"><div class="col-12"><div class="mb-3"><label for="validationCustom02" class="form-label text-light">Description</label><input type="text" class="form-control" id="validationCustom02" placeholder="Description" name="addmordescription[' +
                i +
                ']"></div></div><div class="col-12"><div class="mt-4 mb-3  d-flex justify-content-center"><button class="btn btn-danger remove_div" style="width: 33%" type="button"> Remove</button></div> </div>  </section>'
            );
        });

        $(document).on('click', '.remove_div', function() {
            $(this).parents('section').remove();
        });

        // #####################################################################################################
        var m = 0;

        $("#add_timeslote").click(function() {

            ++m;

            $("#timeslote_row").append(
                '  <section class="rounded p-3 m-3" style="background-color: #c1c1c1"><div class="col-12"><div class="mb-3"><label for="validationCustom02" class="form-label text-light">Time slote</label><input type="time" class="form-control" id="validationCustom02" placeholder="Time slote" name="timeslote[' +
                m +
                ']"></div></div><div class="col-12"><div class="mt-4 mb-3  d-flex justify-content-center"><button class="btn btn-danger remove_timeslote" style="width: 33%" type="button"> Remove</button></div> </div>  </section>'
            );
        });

        $(document).on('click', '.remove_timeslote', function() {
            $(this).parents('section').remove();
        });
        // #####################################################################################################
        var b = 0;
        var title = 'title';
        $("#add_freq").click(function() {

            ++b;

            $("#frequency_row").append(
                ' <section class="bg-dark rounded p-3 mt-3" style="width:100%;"> <div class="row"><div class="col-3"> <div class="mb-3"> <label for="validationCustom02 " class="form-label text-light">Title</label><input type="text" class="form-control" id="validationCustom02" placeholder="Title" name="frequency[' +
                b +
                '][title]"><div class="valid-feedback">Looks good!</div> </div></div> <div class="col-3"> <div class="mb-3"> <label for="validationCustom02 " class="form-label text-light">Description</label> <input type="text" class="form-control" id="validationCustom02" placeholder="Description" name="frequency[' +
                b +
                '][description]"> <div class="valid-feedback"> Looks good! </div> </div> </div> <div class="col-3"> <div class="mb-3"> <label for="validationCustom02 " class="form-label text-light">Number of dates</label> <input type="number" class="form-control" id="validationCustom02" placeholder="Number of dates" name="frequency[' +
                b +
                '][number_of_dates]"> <div class="valid-feedback"> Looks good! </div> </div> </div> <div class="col-3"> <div class="mb-3"> <label for="validationCustom02 " class="form-label text-light">Price</label> <input type="number" class="form-control" id="validationCustom02" placeholder="Price in AED" name="frequency[' +
                b +
                '][price]"> <div class="valid-feedback"> Looks good! </div> </div> </div> <div class="col-12"> <div class="mt-4 mb-3  d-flex justify-content-center"> <button class="btn btn-danger remove_freq" style="width: 33%" type="button"> Remove</button> </div> </div> </div> </section>'
            );
        });

        $(document).on('click', '.remove_freq', function() {
            $(this).parents('section').remove();
        });
    </script>
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
    <!-- form repeater js -->
    <script src="{{ URL::asset('/assets/libs/jquery-repeater/jquery-repeater.min.js') }}"></script>

    <script src="{{ URL::asset('/assets/js/pages/form-repeater.int.js') }}"></script>
@endsection
