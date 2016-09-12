DO_NOT_SYMLINK = %w(
    Rakefile
    README.md
).freeze

def error(text)
    STDERR.puts "ERROR: #{text}"
end

def info(text)
    STDOUT.puts "INFO: #{text}"
end

def build_link(file, basename, source, target)
    if File.file?(file) && !DO_NOT_SYMLINK.include?(basename)
        if File.symlink?(target)
            error "There is already a symlink for #{basename} consider removing \n #{target}"
        elsif File.exist?(target)
            error "There is already a file for #{basename} consider removing or replacing \n #{target}"
        else
            into "Create symlink for #{basename}"
            print '? '
            if STDIN.gets =~ /^y/i
                info "Creating symlink for #{basename} \n #{target} --> #{source}"
                FileUtils.ln_s(source, target)
                system "source #{target}"
            else
              info "No symlink created for #{basename}"
            end
        end
    end
end

def build_in_dir
  Dir['*'].each do |file|
    source = File.join(Dir.pwd, file)
    basename = File.basename(source)
    target = File.expand_path("~/.#{basename}")
    build_link(file, basename, source, target)
  end
end

task default: :install

desc 'Install all dotfiles'

task :install do
    build_in_dir
    Dir.chdir(Dir.pwd + '/git') do
        build_in_dir
    end
    Dir.chdir(Dir.pwd + '/vim') do
        build_in_dir
    end
end
