--[[
LuCI - Lua Configuration Interface
Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2011 Jo-Philipp Wich <xm@subsignal.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
	http://www.apache.org/licenses/LICENSE-2.0

* Copyright (c) 2013, VIA Technologies, Inc.
* Project Name:  ViaView web implementation
* File Name   :  ViaView.lua
* Author      :  Rock Yang
* Data        :  2013/05/21
* Description :  this file is use to add tab to web.
* Revision History
 NO         Data     Revised by       Item       Description
1.0.0.1   2013/05/21  Rock Yang       ...       First release

]]--

module("luci.controller.admin.ViaView", package.seeall)

function index()

	--notice that viaview is the name of the file ViaView.lua
	--entry({"admin", "ViaView"}, firstchild(), "ViaView", 60).dependent=false
	--entry({"admin", "system"}, alias("admin", "system", "system"), _("System"), 30).index = true
	entry({"admin", "ViaView"}, alias("admin", "ViaView", "APList"), _("ViaView"), 60).index = true

	entry({"admin", "ViaView", "APList"}, template("admin_ViaView/ApList"), _("AP List"), 1)
	entry({"admin", "ViaView", "APList", "ApConfig"}, template("admin_ViaView/ApConfig"), nil).leaf = true
	entry({"admin", "ViaView", "APList", "ApConfigSave"}, template("admin_ViaView/ApConfigSave"), nil).leaf = true
	entry({"admin", "ViaView", "APList", "ApConfigSaveAjax"}, template("admin_ViaView/ApConfigSaveAjax"), nil).leaf = true
	entry({"admin", "ViaView", "APList", "ApNameSave"}, template("admin_ViaView/ApNameSave"), nil).leaf = true
	--entry({"admin", "ViaView", "ApConfig"}, template("admin_ViaView/ApConfig"), "AP config", 60).dependent=false

	entry({"admin", "ViaView", "ClientList"}, template("admin_ViaView/ClientList"), _("Client List"), 2)

	entry({"admin", "ViaView", "Profile"}, template("admin_ViaView/Profile"), _("Profile Management"), 3)
	entry({"admin", "ViaView", "Profile", "ProfileAdd"}, template("admin_ViaView/ProfileAdd"), nil).leaf = true
	entry({"admin", "ViaView", "Profile", "ProfileDelete"}, template("admin_ViaView/ProfileDelete"), nil).leaf = true
	entry({"admin", "ViaView", "Profile", "ProfileModify"}, template("admin_ViaView/ProfileModify"), nil).leaf = true

	entry({"admin", "ViaView", "APUpdate"}, template("admin_ViaView/ApUpdate"), _("Update Firmware / Profile"), 4)
	entry({"admin", "ViaView", "APUpdateAjax"}, template("admin_ViaView/ApUpdateAjax"), nil).leaf = true

	entry({"admin", "ViaView", "MACSecurity"}, template("admin_ViaView/MacSecurity"), _("MAC Security"), 5)

	entry({"admin", "ViaView", "ACSyslogIP"}, template("admin_ViaView/AcSyslogIp"), _("AC / Syslog IP"), 6)
	entry({"admin", "ViaView", "ACSyslogIPSave"}, template("admin_ViaView/AcSyslogIpSave"), nil).leaf = true

	--entry({"admin", "ViaView", "NetV4Config"}, template("admin_ViaView/NetV4Config"), _("Network V4 config"), 7)
	--entry({"admin", "ViaView", "NetV6Config"}, template("admin_ViaView/NetV6Config"), _("Network V6 config"), 8)

	entry({"admin", "ViaView", "FriendlyRogueAp"}, template("admin_ViaView/FriendlyRogueAp"), _("Friendly / Rogue AP"), 10)
	entry({"admin", "ViaView", "FriendlyRogueApSave"}, template("admin_ViaView/FriendlyRogueApSave"), nil).leaf = true

	entry({"admin", "ViaView", "StatisticsData"}, template("admin_ViaView/StatisticsData"), _("Statistics Data"), 15)
	entry({"admin", "ViaView", "APSTALog"}, template("admin_ViaView/ApStaLog"), _("AP / STA log"), 16)
end

--[[
function action_iptables()
	if luci.http.formvalue("zero") then
		if luci.http.formvalue("zero") == "6" then
			luci.util.exec("ip6tables -Z")
		else
			luci.util.exec("iptables -Z")
		end
		luci.http.redirect(
			luci.dispatcher.build_url("admin", "status", "iptables")
		)
	elseif luci.http.formvalue("restart") == "1" then
		luci.util.exec("/etc/init.d/firewall reload")
		luci.http.redirect(
			luci.dispatcher.build_url("admin", "status", "iptables")
		)
	else
		luci.template.render("admin_status/iptables")
	end
end
]]--


--[[
function action_tryme()
    luci.http.prepare_content("text/plain")
    luci.http.write("Haha, rebooting now...")
    luci.sys.reboot()
end
]]--


