import Kernel, except: [if: 2, unless: 2]
import IO
defmodule Sfetch do
  def cpuName() do
    cn = CpuInfo.all_profile[:cpu].cpu_model
    arch = CpuInfo.all_profile[:cpu].cpu_type
    puts(:stderr, "    \x1b[38;5;1mCpu Name: \x1b[38;5;7m#{Kernel.inspect(cn)} #{Kernel.inspect(arch)}")
  end
  def osName()do
    os = :os.type()
    puts("    \x1b[38;5;1mOS & Kernel:  \x1b[38;5;7m#{Kernel.inspect(os)}")
  end
  def  host() do
    {:ok, hostname} = :inet.gethostname
    puts(:stderr,"    \x1b[38;5;1mHostname: \x1b[38;5;7m#{hostname}")
  end
    def time() do
      datetime = Timex.now()
      time = Timex.format!(datetime, "%T %F", :strftime)
      puts(:stderr, "    \x1b[38;5;1mTime:  \x1b[38;5;7m#{time}")
    end
    def test() do
      puts(:stderr, " \x1b[38;5;3mSysFetch: ")
      Sfetch.cpuName()
      Sfetch.osName()
      Sfetch.host()
      Sfetch.time()
    end
end

puts(:stderr, " \x1b[38;5;3mSysFetch: ")
Sfetch.cpuName()
Sfetch.osName()
Sfetch.host()
Sfetch.time()
