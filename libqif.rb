class Libqif < Formula
  desc "A Quantitative Information Flow C++ library"
  homepage "https://github.com/chatziko/libqif"
  head "https://github.com/chatziko/libqif.git"

  depends_on "cmake" => :build
  depends_on "homebrew/science/armadillo" => "with-cxx11"
  depends_on "homebrew/science/glpk"
  depends_on "gsl"
  depends_on "gmp"

  def install
    ENV.cxx11

    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libqif`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
