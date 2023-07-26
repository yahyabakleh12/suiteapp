@extends('layouts.master-without-nav')

@section('title')
    @lang('translation.Coming_Soon')
@endsection

@section('body')

    <body>
    @endsection

    @section('content')
        <div class="my-5 pt-sm-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <a href="index" class="d-block auth-logo">
                                <img src="{{ URL::asset('/assets/images/ho_logo.png') }}" alt="" height="80"
                                    class="auth-logo-dark mx-auto">
                                <img src="{{ URL::asset('/assets/images/ho_logo.png') }}" alt="" height="80"
                                    class="auth-logo-light mx-auto">
                            </a>
                            
                            <h4 class="mt-5">Welcome To suite Life Access control system</h4>
                            <p class="text-muted">Scan and Enjoy.</p>
                            <div>
                                {!! QrCode::size(300)->generate($code) !!}</div>
                        </div>
                       
                    </div>
                    <div class="col-6 d-flex justify-content-end mt-5">
                        <img src="{{ URL::asset('/assets/images/google.png') }}" alt="" height="50px">
                    </div>
                    <div class="col-6 d-flex justify-content-start mt-5">
                        <img src="{{ URL::asset('/assets/images/apple.png') }}" alt="" height="50px">
                    </div>

                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>
                            document.write(new Date().getFullYear())
                        </script> © Suite Life.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Design & Develop by PARKONIC Development Team
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"
            integrity="sha512-Zq9o+E00xhhR/7vJ49mxFNJ0KQw1E1TMWkPTxrWcnpfEFDEXgUiwJHIKit93EW/XxE31HSI5GEOW06G6BF1AtA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        {{-- <script>
        
        
        
        
        </script> --}}
        
        
        
        {{-- <script>
            // Enable pusher logging - don't include this in production
            Pusher.logToConsole = true;
        
            var pusher = new Pusher('03c5aa29e97c7aefbcf3', {
                cluster: 'ap2'
            });
            var channel = pusher.subscribe('my-channel');
            channel.bind('my-event', function(data) {
                iziToast.show({
                    theme: 'dark',
                    icon: 'icon-person',
                    // title: 'New Order',
                    message: data.message,
                    position: 'bottomRight', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
                    progressBarColor: '#984e77',
                    buttons: [
                        ['<button>check</button>', function(instance, toast) {
                            window.open("http://192.168.20.242:8000/admin/orders");
                        }, true], // true to focus
                        ['<button>Close</button>', function(instance, toast) {
                            instance.hide({
                                transitionOut: 'fadeOutUp',
                                onClosing: function(instance, toast, closedBy) {
                                    console.info('closedBy: ' +
                                    closedBy); // The return will be: 'closedBy: buttonName'
                                }
                            }, toast, 'buttonName');
                        }]
                    ],
                    onOpening: function(instance, toast) {
                        console.info('callback abriu!');
                    },
                    onClosing: function(instance, toast, closedBy) {
                        console.info('closedBy: ' +
                        closedBy); // tells if it was closed by 'drag' or 'button'
                    }
                });
        
                // alert(JSON.stringify(data));
            });
        </script> --}}
        
    @endsection
    @section('script')
        <!-- Plugins -->
        <script src="{{ URL::asset('/assets/libs/jquery-countdown/jquery-countdown.min.js') }}"></script>

        <!-- oming-soon init -->
        <script src="{{ URL::asset('/assets/js/pages/coming-soon.init.js') }}"></script>
    @endsection
