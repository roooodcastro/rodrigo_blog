// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require markdown-it
//= require to-mark
//= require tui-code-snippet
//= require tui-color-picker
//= require codemirror
//= require highlight
//= require squire-rte/squire-raw
//= require tui-editor
//= require tui-editor-color-syntax
//= require tui-editor-table

$(document).on('turbolinks:load', function () {
    let editor = new tui.Editor({
        el: document.querySelector('#tuiEditor'),
        initialEditType: 'markdown',
        previewStyle: 'tab',
        height: '500px',
        usageStatistics: false,
        initialValue: $('#blog_article_content').val(),
        exts: ['colorSyntax', 'table']
    });

    $('form').on('submit', function() {
       debugger;
       $('#blog_article_content').val(editor.getMarkdown());
    });
});