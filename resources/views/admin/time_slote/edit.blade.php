@extends('layouts.master')

@section('title') Edit Area @endsection

@section('content')

    @component('components.breadcrumb')
        @slot('li_1') Area @endslot
        @slot('title')Edit buiulding  @endslot
    @endcomponent
    @if($errors->any())
    {!! implode('', $errors->all('<div class="alert alert-danger">:message</div>')) !!}  
    @endif
   
 
    <div class="row">
    
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    
                    <form class="needs-validation" action="{{ route('time-slote.update',$time_slote->id) }}" method="POST">
                        @csrf
                        @method("put")
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="validationCustom01" class="form-label">time</label>
                                    <input type="text" class="form-control @error('time')
                                    invalid
                                    @enderror" name="time" id="validationCustom01" placeholder="time"
                                        value="{{old('time',$time_slote->time)}}" required>
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
