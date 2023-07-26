@extends('layouts.master')

@section('title')
    Edit
@endsection

@section('content')
    @component('components.breadcrumb')
        @slot('li_1')
            Booking
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

                    <form class="needs-validation" action="{{ route('building.booking.update', $booking->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="row bg-primary p-3 m-3 rounded ">
                                <h4 class="text-light text-center font-size-80">{{ $booking->User->name }} / {{$booking->facility_services->name}}</h4>
                            </div>
                           
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">Date</label>
                                        <input type="date"
                                            class="form-control @error('date')
                                    invalid
                                    @enderror"
                                            name="date" id="validationCustom01" placeholder="date"
                                            value="{{ old('date', $booking->date) }}" disabled required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">Time</label>
                                        <select 
                                            class="form-control @error('time')
                                    invalid
                                    @enderror"
                                            name="time" id="validationCustom01"
                                             required>
                                            <option value="{{$booking->time}}" selected>{{ $booking->time }}</option>
                                            @foreach ($booking->available as $item)
                                                <option value="{{$item}}">{{$item}}</option>
                                            @endforeach
                                            </select>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
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
