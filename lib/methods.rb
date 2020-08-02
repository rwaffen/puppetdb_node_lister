def convert_from_utc_to_local(datetime)
  zone = ActiveSupport::TimeZone.new("Europe/Berlin")
  time = DateTime.parse(datetime)
  time = time.new_offset(zone.formatted_offset)
  time = time + (1/24.0) if Time.now.dst?
  time = time.strftime("%Y-%m-%d - %H:%M:%S")
end

def get_all_node_facts(node_name)
  api_result = RestClient.get "http://#{settings.puppetdb}:8080/pdb/query/v4/nodes/#{node_name}/facts", { :accept => :json }

  if api_result.code == 200
    return JSON.parse(api_result)
  else
    return false
  end
end

def get_all_nodes_from_environment(environment)
  api_result = RestClient.get "http://#{settings.puppetdb}:8080/pdb/query/v4/nodes", params: {query: '["=", "catalog_environment", "' + environment + '"]' }

  if api_result.code == 200
    return JSON.parse(api_result)
  else
    return false
  end
end

def get_node_last_report(node_name)
  api_result = RestClient.get "http://#{settings.puppetdb}:8080/pdb/query/v4/reports", params: {query: '["and", ["=", "certname", "' + node_name + '"],["=", "latest_report?", "true"]]' }

  if api_result.code == 200
    return JSON.parse(api_result)
  else
    return false
  end
end

def get_environments
  api_result = RestClient.get "http://#{settings.puppetdb}:8080/pdb/query/v4/environments"

  if api_result.code == 200
    return JSON.parse(api_result)
  else
    return false
  end
end

def get_environment_nodes_from_inventory(environment)
  api_result = RestClient.get "http://#{settings.puppetdb}:8080/pdb/query/v4/inventory", params: {query: '["=", "environment", "' + environment + '"]' }

  if api_result.code == 200
    return JSON.parse(api_result)
  else
    return false
  end
end
