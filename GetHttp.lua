local req = (syn and syn.request) or (http and http.request) or http_request

function GetHttp(URL)
	local Data = nil
	local Test = req({
        Url = URL,
        Method = 'GET',
	})
	for i,v in pairs(Test) do
		Data = v
	end
	return Data
end
