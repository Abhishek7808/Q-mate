@keyword
function getCheckboxByValue(v) {
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
                if(inputs[i].type == "checkbox" && inputs[i].value == v) {
                        return inputs[i];
                }
        }
        return false;
}
(function testCheckbox() {
        getCheckboxByValue("1").checked = true;
})();