/******/ (function() { // webpackBootstrap
/*!*************************************************!*\
  !*** ./resources/js/pages/email-editor.init.js ***!
  \*************************************************/
/*
Template Name: Suite Life - Admin Dashboard 
Author: Themesbrand
Website: https://themesbrand.com/
Contact: themesbrand@gmail.com
File: Email summernote Js File
*/
$(document).ready(function () {
  if ($("#email-editor ").length > 0) {
    tinymce.init({
      selector: "textarea#email-editor",
      height: 200,
      plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"],
      toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
      style_formats: [{
        title: 'Bold text',
        inline: 'b'
      }, {
        title: 'Red text',
        inline: 'span',
        styles: {
          color: '#ff0000'
        }
      }, {
        title: 'Red header',
        block: 'h1',
        styles: {
          color: '#ff0000'
        }
      }, {
        title: 'Example 1',
        inline: 'span',
        classes: 'example1'
      }, {
        title: 'Example 2',
        inline: 'span',
        classes: 'example2'
      }, {
        title: 'Table styles'
      }, {
        title: 'Table row 1',
        selector: 'tr',
        classes: 'tablerow1'
      }]
    });
  }
});
/******/ })()
;