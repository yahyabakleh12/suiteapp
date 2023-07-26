@extends('layouts.master')

@section('title')
    Edit
@endsection

@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Facilities
        @endslot
        @slot('title')
            Edit
        @endslot
    @endcomponent
    @if ($errors->any())
        {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}
    @endif


    <div class="row">
        <div class="col-12">

        </div>
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" action="{{ route('facility.update', $facility->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="row bg-primary p-3 m-3 rounded ">
                                <h4 class="text-light text-center font-size-80">{{ $facility->name }}</h4>
                            </div>
                            @if ($facility->is_all_time == 0)
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">start</label>
                                        <input type="time"
                                            class="form-control @error('start')
                                    invalid
                                    @enderror"
                                            name="start" id="validationCustom01" placeholder="start"
                                            value="{{ old('start', $facility->start) }}" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">end</label>
                                        <input type="time"
                                            class="form-control @error('end')
                                    invalid
                                    @enderror"
                                            name="end" id="validationCustom01" placeholder="end"
                                            value="{{ old('end', $facility->end) }}" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                            @endif
                            @if ($facility->is_booking == 1)
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">Duration(min)</label>
                                        <input type="number"
                                            class="form-control @error('duration')
                                    invalid
                                    @enderror"
                                            name="duration" id="validationCustom01" placeholder="duration in minits"
                                            value="{{ old('duration', $facility->duration) }}">
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="col-md-6">
                                <div class="form-check form-check-primary mb-3">
                                    <input class="form-check-input" type="checkbox" id="formCheckcolor1" name="sharing"
                                        @if ($facility->sharing) checked @endif>
                                    <label class="form-check-label" for="formCheckcolor1">
                                        Sharing Access
                                    </label>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary" type="submit">save</button>
                        <a href="{{ url('/building') }}" class="btn"
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
    <script src="{{ URL::asset('/assets/libs/parsleyjs/parsleyjs.min.js') }}"></script>

    <script src="{{ URL::asset('/assets/js/pages/form-validation.init.js') }}"></script>
@endsection
