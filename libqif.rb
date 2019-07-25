class Libqif < Formula
  desc "A Quantitative Information Flow C++ library"
  homepage "https://github.com/chatziko/libqif"
  head "https://github.com/chatziko/libqif.git"

  depends_on "cmake" => :build
  depends_on "armadillo" => "with-cxx11"
  depends_on "glpk"
  depends_on "gsl"
  depends_on "gmp"
  depends_on "mizux/or-tools/or-tools"

  def install
    ENV.cxx11
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
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
