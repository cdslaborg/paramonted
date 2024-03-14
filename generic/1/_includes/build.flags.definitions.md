{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

{% assign iclWindowsReleaseFlags = "/O3 /Qip /Qipo /Qunroll /Qunroll-aggressive /Ob2 /Qinline-dllimport" %}
{% assign iclWindowsTestingFlags = "/Od" %}
{% assign iclWindowsDebugFlags   = "/debug:full /Zi /Od /Wall /traceback /Qcheck-pointers:rw /Qcheck-pointers-undimensioned /Qdiag-error-limit:10 /Qtrapuv" %}

{% assign clWindowsReleaseFlags  = "/O2" %}
{% assign clWindowsTestingFlags  = "/Od" %}
{% assign clWindowsDebugFlags    = "/Od /Z7" %}

{% assign iccLinuxReleaseFlags = "-O3" %}
{% assign iccLinuxTestingFlags = "-O0" %}
{% assign iccLinuxDebugFlags   = "-O0 -debug full" %}

{% assign iccDarwinReleaseFlags = "-no-multibyte-chars -O3" %}
{% assign iccDarwinTestingFlags = "-no-multibyte-chars -O0" %}
{% assign iccDarwinDebugFlags   = "-no-multibyte-chars -O0 -debug full" %}

{% assign gccLinuxReleaseFlags = "-O3" %}
{% assign gccLinuxTestingFlags = "-O0" %}
{% assign gccLinuxDebugFlags   = "-O0 -g" %}

{% assign ifortWindowsReleaseFlags = "/standard-semantics /O3 /Qip /Qipo /Qunroll /Qunroll-aggressive /fpp" %}
{% assign ifortWindowsTestingFlags = "/standard-semantics /Od /fpp" %}
{% assign ifortWindowsDebugFlags   = "/standard-semantics /Od /debug:full /CB /Qinit:snan,arrays /warn:all /gen-interfaces /traceback /check:all /fpe-all:0 /Qtrapuv /fpp" %}

{% assign ifortLinuxReleaseFlags = "-standard-semantics -O3 -ip -ipo -unroll -unroll-aggressive -finline-functions -fpp" %}
{% assign ifortLinuxTestingFlags = "-standard-semantics -O0 -fpp" %}
{% assign ifortLinuxDebugFlags   = "-standard-semantics -O0 -debug full -fpp" %}

{% assign gfortranLinuxReleaseFlags = "-std=gnu -O3 -funroll-loops -finline-functions -ftree-vectorize -cpp" %}
{% assign gfortranLinuxTestingFlags = "-std=gnu -O0 -cpp" %}
{% assign gfortranLinuxDebugFlags   = "-std=gnu -O0 -g -cpp" %}

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
