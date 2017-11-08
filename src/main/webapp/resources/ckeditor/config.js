/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
CKEDITOR.editorConfig = function( config ) {
   config.toolbarGroups = [
        { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
      { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
      { name: 'colors', groups: [ 'colors' ] },
      { name: 'basicstyles', groups: [ 'basicstyles'] },
      { name: 'others', groups: [ 'others' ] },
      { name: 'links', groups: [ 'links' ] },
      { name: 'insert', groups: [ 'insert' ] },
      { name: 'paragraph', groups: [ 'list', 'align', ] },
      { name: 'about', groups: [ 'about' ] },
      { name: 'styles', groups: [ 'styles' ] }
   ];
    /*      { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
      { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
      { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
      { name: 'forms', groups: [ 'forms' ] },
      { name: 'colors', groups: [ 'colors' ] },
      { name: 'others', groups: [ 'others' ] },
      { name: 'links', groups: [ 'links' ] },
      { name: 'insert', groups: [ 'insert' ] },
      { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
      { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
      { name: 'styles', groups: [ 'styles' ] },
      { name: 'about', groups: [ 'about' ] },
      { name: 'tools', groups: [ 'tools' ] }*/

   config.removeButtons = 'About,Maximize,\\\PasteFromWord';
    // Set the most common block elements.
    config.format_tags = 'p;h1;h2;h3;pre';

    // Simplify the dialog windows.
    config.removeDialogTabs = 'image:advanced;link:advanced';
    
    config.filebrowserBrowseUrl = '/';
    config.filebrowserUploadUrl = '/';
};