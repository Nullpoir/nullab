module SubdomainApi
  def self.matches?(request)
    if Rails.env.production?
      request.subdomain == "api"  
    else
      request.subdomain.blank?
    end
  end

  def self.path
    'api' unless Rails.env.production?
  end
end
