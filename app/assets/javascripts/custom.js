$(document).on('ready page:load turbolinks:load', function ()  {
  $('#myTags').tagit();

  $('#readOnlyTags').tagit({
    readOnly: true,
    onTagClicked: function(evt, ui) {
      window.location.href = '/tags/'+ui.tagLabel;
      return false;
    }
  });

  $('#optgroup').multiSelect({

    selectableFooter: "<div class='custom-header'> </div>",
    selectionFooter: "<div class='custom-header'> </div>",
    selectableOptgroup: true,


    selectableHeader: "<div class='custom-header'>可選擇</div><input type='text' class='form-control' autocomplete='off' placeholder='Type to search'>",
    selectionHeader: "<div class='custom-header'>已選擇</div><input type='text' class='form-control' autocomplete='off' placeholder='Type to search'>",
    afterInit: function(ms){
      var that = this,
          $selectableSearch = that.$selectableUl.prev(),
          $selectionSearch = that.$selectionUl.prev(),
          selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
          selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

      that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
      .on('keydown', function(e){
        if (e.which === 40){
          that.$selectableUl.focus();
          return false;
        }
      });

      that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
      .on('keydown', function(e){
        if (e.which == 40){
          that.$selectionUl.focus();
          return false;
        }
      });
    },
    afterSelect: function(){
      this.qs1.cache();
      this.qs2.cache();
    },
    afterDeselect: function(){
      this.qs1.cache();
      this.qs2.cache();
    }
  });
});
