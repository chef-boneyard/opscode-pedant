opscode_pedant "oc-authz-pedant" do
  variables({
              :host => "http://heimdall.opscode.us",
              :port => 1234
            })
end
