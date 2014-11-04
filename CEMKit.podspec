Pod::Spec.new do |s|
    s.name         = "CEMKit"
    s.version      = "1.0"
    s.summary      = "handy library for no-xibbers"
    s.homepage     = "https://github.com/cemolcay/CEMKit"

    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "Cem Olcay" => "ccemolcay@gmail.com" }
    s.source       = {
        :git => "https://github.com/cemolcay/CEMKit.git",
        :tag => "1.0"
    }

    s.platform     = :ios, '7.0'
    s.source_files = 'CEMKit/*.{h,m}'
    s.requires_arc = true
end
