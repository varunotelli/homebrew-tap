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
    (testpath/"test.cpp").write <<-EOS
      #include <iostream>
      #include <qif>
      using namespace std;
      using namespace qif;

      int main(int argc, char** argv)
        {
        cout << probab::is_proper(probab::uniform<double>(5)) << endl;
        }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-L#{lib}", "-std=c++11", "-lqif", "-larmadillo", "-o", "test"
    assert_equal `./test`, "1\n"
  end
end
