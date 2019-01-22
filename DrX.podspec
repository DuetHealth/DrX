Pod::Spec.new do |s|
  s.name                  = 'DrX'
  s.version               = '2.0.0'
  s.summary               = "The Rx doctor is in the house, curing all your ailments with simple-yet-expressive operators and extensions. Includes Cocoa Touch support!"
  s.description           = "DrX is a collection of convenience extensions of RxSwift which add new operators for concisely handling common patterns and/or scenarios. In addition to an agnostic core, DrX also supports iOS RxCocoa."
  s.license               = { type: 'MIT', file: 'LICENSE' }
  s.author                = { 'Duet Health': 'info@duethealth.com' }
  s.social_media_url      = 'https://twitter.com/DuetHealth'
  s.source                = { git: 'https://github.com/DuetHealth/DrX.git', tag: "#{s.version}" }
  s.homepage              = "#{s.source[:git]}"
  s.default_subspec       = 'Core'
  s.requires_arc          = true
  s.ios.deployment_target = '8.0'
  s.swift_version         = '4.1'

  s.subspec 'Core' do |core|
    core.source_files = "DrX/Sources/Core/**/*.{h,m,swift}"
  end

  s.subspec 'Cocoa-Touch' do |touch|
    touch.source_files = "DrX/Sources/**/*.{h,m,swift}"
    touch.dependency 'RxCocoa'
  end

  s.dependency 'RxSwift'

end
