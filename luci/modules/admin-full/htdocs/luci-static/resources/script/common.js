function checkAll(obj, cbxName)
{
	var i;
	var cbx = document.getElementsByName(cbxName);
	for(i = 0; i < cbx.length; i++)
		cbx[i].checked = obj.checked;
}

function modifyName(eid, targetName)
{
	var v = document.getElementById(eid);
	v.name = targetName;
}
