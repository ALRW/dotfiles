DO_NOT_SYMLINK = %w(
    Rakefile
    README.md
).freeze

def error(text)
    STDERR.puts "! #{text}"
end

def info(text)
    STDOUT.puts "* #{text}"
end

task default: :install

desc 'Install all dotfiles'

task :install do
    Dir['*'].each do |file|
        source = File.join(Dir.pwd, file)
        basename = File.basename(source)
        target = File.expand_path("~/.#{basename}")
        next unless File.file?(file) && !DO_NOT_SYMLINK.include?(basename)
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
                next
            end
        end
    end
end
