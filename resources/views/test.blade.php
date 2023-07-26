@extends('layouts.master-without-nav')
@section('title')
    @lang('translation.Checkout')
@endsection

@section('css')
    <!-- select2 css -->
    <link href="{{ URL::asset('/assets/libs/select2/select2.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('content')
 
    <div class="container">


        <div class="checkout-tabs">
            <div class="row">
                <div class="col-xl-12 col-sm-12">
                    <div class="card">
                        <div class="card-body">

                            <div>
                                <h4 class="card-title">Payment information</h4>
                                <p class="card-title-desc">Fill all information below</p>

                                {{-- <div>
                                    <div class="form-check form-check-inline font-size-16">
                                        <input class="form-check-input" type="radio" name="paymentoptionsRadio"
                                            id="paymentoptionsRadio1" checked>
                                        <label class="form-check-label font-size-13" for="paymentoptionsRadio1"><i
                                                class="fab fa-cc-mastercard me-1 font-size-20 align-top"></i> Credit /
                                            Debit Card</label>
                                    </div>
                                    <div class="form-check form-check-inline font-size-16">
                                        <input class="form-check-input" type="radio" name="paymentoptionsRadio"
                                            id="paymentoptionsRadio2">
                                        <label class="form-check-label font-size-13" for="paymentoptionsRadio2"><i
                                                class="fab fa-cc-paypal me-1 font-size-20 align-top"></i> Paypal</label>
                                    </div>
                                    <div class="form-check form-check-inline font-size-16">
                                        <input class="form-check-input" type="radio" name="paymentoptionsRadio"
                                            id="paymentoptionsRadio3">
                                        <label class="form-check-label font-size-13" for="paymentoptionsRadio3"><i
                                                class="far fa-money-bill-alt me-1 font-size-20 align-top"></i> Cash on
                                            Delivery</label>
                                    </div>
                                </div> --}}

                                <h5 class="mt-5 mb-3 font-size-15">For card Payment</h5>
                                <div class="p-4 border">
                                    <form action="{{ route('test')}}" method="POST">
                                        @csrf
                                        <div class="form-group mb-0">
                                            <label for="cardnumberInput">Card Number</label>
                                            <input type="text" class="form-control" id="cardnumberInput"
                                                placeholder="0000 0000 0000 0000">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group mt-4 mb-0">
                                                    <label for="cardnameInput">Name on card</label>
                                                    <input type="text" class="form-control" id="cardnameInput"
                                                        placeholder="Name on Card">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group mt-4 mb-0">
                                                    <label for="expirydateInput">Expiry date</label>
                                                    <input type="text" class="form-control" id="expirydateInput"
                                                        placeholder="MM/YY">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group mt-4 mb-0">
                                                    <label for="cvvcodeInput">CVV Code</label>
                                                    <input type="text" class="form-control" id="cvvcodeInput"
                                                        placeholder="Enter CVV Code">
                                                </div>
                                            </div>
                                            <div class="col-lg-12 d-flex justify-content-center">
                                                <div class="form-group mt-4 mb-0">
                                                  
                                                    <input type="submit" class="btn btn-danger" value="pay">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
@endsection
@section('script')
    <!-- select 2 plugin -->
    <script src="{{ URL::asset('/assets/libs/select2/select2.min.js') }}"></script>

    <!-- init js -->
    <script src="{{ URL::asset('/assets/js/pages/ecommerce-select2.init.js') }}"></script>
@endsection
