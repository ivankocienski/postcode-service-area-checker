require File.join(Rails.root, 'lib/postcode_checker/lib/core')
require File.join(Rails.root, 'lib/postcode_checker/lib/allow_list')
require File.join(Rails.root, 'lib/postcode_checker/lib/remote_data_api')

module PostcodeChecker
    module_function

    def postcode_in_area?(postcode_param)
        Core.postcode_in_area? postcode_param
    end
end