WORKSPACE = '-workspace tips.xcworkspace'
SCHEME = '-scheme "tips"'
SDK = '-sdk iphonesimulator8.1'

task :clean do
  exec "xctool #{WORKSPACE} #{SCHEME} #{SDK} clean"
end

task :test do
  exec "xctool #{WORKSPACE} #{SCHEME} #{SDK} build-tests run-tests"
end
