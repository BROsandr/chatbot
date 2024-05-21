{python3
,fetchFromGitHub
,lib
}:

with python3.pkgs;

buildPythonPackage rec {
  pname = "free-proxy";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jundymek";
    repo = "free-proxy";
    rev = "6faf092b0bd66b5004dc2dd67f8272c311c61bbb";
    hash = "sha256-n4CdkbqLLAj+54mlVOhIuK75wAHZIlSSKNRM1OgsMS0=";
  };

  nativeBuildInputs = [
    setuptools-scm
  ];

  propagatedBuildInputs = [
    lxml
    requests
  ];

  meta = with lib; {
    description = "Get free proxies";
    homepage = "https://https://github.com/jundymek/free-proxy";
    license = licenses.mit;
  };
}
