function checkAll(obj, cbxName)
{
	var i;
	var cbx = document.getElementsByName(cbxName);
	for(i = 0; i < cbx.length; i++)
		cbx[i].checked = obj.checked;
}
