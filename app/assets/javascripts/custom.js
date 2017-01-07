$(document).on('ready page:load', function ()  {
  $('#optgroup').multiSelect({
    selectableHeader: "<div class='custom-header'>可選擇商品</div>",
    selectionHeader: "<div class='custom-header'>已選擇商品</div>",
    selectableFooter: "<div class='custom-header'> </div>",
    selectionFooter: "<div class='custom-header'> </div>",
    selectableOptgroup: true
  });
});
