@extends('layouts.master')

@section('title') Create time slote @endsection

@section('content')

    @component('components.breadcrumb')
        @slot('li_1') Time Slote @endslot
        @slot('title')create new time slote  @endslot
    @endcomponent
    @if($errors->any())
    {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}  
    @endif
   
 
    <div class="row">
    
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    
                    <form class="needs-validation" action="{{ route('time-slote.store') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label">Time From</label>
                                    <input type="time" class="form-control @error('time_from')
                                    invalid
                                    @enderror" name="time_from" id="validationCustom01" placeholder="time"
                                        value="{{old('time_from','')}}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label">Time To</label>
                                    <input type="time" class="form-control @error('time_to')
                                    invalid
                                    @enderror" name="time_to" id="validationCustom01" placeholder="time"
                                        value="{{old('time_to','')}}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                       
                            <button class="btn btn-primary" type="submit">save</button>
                            <a href="{{ route('time-slote.index')}}" class="btn" style="background-color: gray;color:white">cancel</a>
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
