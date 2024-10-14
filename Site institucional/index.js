//validação do cadastro
//mensagem de erro
var errorMensage = '';
function exibirErro() {
    divError.innerHTML = errorMensage;
}

//empresa
var validNameEmpresa = true;

function validarNomeEmpresa() {
    var name = nameEmpresa.value;

    var qtdName = name.length;

    var nameHasArroba = name.includes('@');
    var nameHasExclama = name.includes('!');
    var nameHasInterrog = name.includes('?');
    var nameHasHashtag = name.includes('#');
    var nameHasCifrao = name.includes('$');
    var nameHasPorcent = name.includes('%');
    var nameHasE = name.includes('&');
    var nameHasAsteris = name.includes('*');
    var nameHasPonto = name.includes('.');


    if (qtdName > 45) {
        validName = false;
        errorMensage = 'O nome excede a quantidade de caracteres permitida';
    } else if (nameHasArroba || nameHasExclama || nameHasInterrog || nameHasHashtag || nameHasCifrao || nameHasPorcent || nameHasAsteris || nameHasPonto || nameHasE) {
        validNameEmpresa = false;
        errorMensage = 'O nome não pode conter caracteres especiais';
    } else {
        validNameEmpresa = true;
        errorMensage = '';
    }

    exibirErro()
}

var validCNPJ = false;

function validarCNPJ() {
    var cnpj = iptCNPJ.value;

    var qtdDigitos = cnpj.length;

    if (qtdDigitos == 14) {
        validCNPJ = true;
        errorMensage = '';
    } else {
        validCNPJ = false;
        errorMensage = 'Insira um CNPJ válido';
    }

    exibirErro()
}

var validCep = false;

function validarCEP() {
    var cep = iptCep.value;

    var qtdDigitos = cep.length;

    if (qtdDigitos == 8) {
        validCep = true;
        errorMensage = '';
    } else {
        validCep = false;
        errorMensage = 'Insira um CEP válido';
    }

    exibirErro()
}

var validEmailEmpresa = false;

function validarEmailEmpresa() {
    var email = iptEmailEmpresa.value;

    var qtdDigitos = email.length;

    var emailHasArroba = email.includes('@');

    var emailHasAsteris = email.includes('*');
    var emailHasExclama = email.includes('!');
    var emailHasInterrog = email.includes('?');
    var emailHasHashtag = email.includes('#');
    var emailHasCifrao = email.includes('$');
    var emailHasPorcent = email.includes('%');


    if (qtdDigitos > 45) {
        validEmailEmpresa = false;
        errorMensage = 'O e-mail excede a quantidade de caracteres permitido';
    } else if (emailHasAsteris || emailHasExclama || emailHasInterrog || emailHasCifrao || emailHasPorcent || emailHasHashtag) {
        validEmailEmpresa = false;
        errorMensage = 'O e-mail não deve conter caracteres especiais';
    } else if (emailHasArroba) {
        validEmailEmpresa = true;
        errorMensage = '';
    } else {
        validEmailEmpresa = false;
        errorMensage = 'Insira um endereço de e-mail válido';
    }

    exibirErro()
}

// usuário
var validNameUser = true;

function validarNome() {
    var name = iptName.value

    var qtdName = name.length;

    var nameHasArroba = name.includes('@');
    var nameHasExclama = name.includes('!');
    var nameHasInterrog = name.includes('?');
    var nameHasHashtag = name.includes('#');
    var nameHasCifrao = name.includes('$');
    var nameHasPorcent = name.includes('%');
    var nameHasE = name.includes('&');
    var nameHasAsteris = name.includes('*');
    var nameHasPonto = name.includes('.');


    if (qtdName > 45) {
        validNameUser = false;
        errorMensage = 'O nome excede a quantidade de caracteres permitida';
    } else if (nameHasArroba || nameHasExclama || nameHasInterrog || nameHasHashtag || nameHasCifrao || nameHasPorcent || nameHasAsteris || nameHasPonto) {
        validNameUser = false;
        errorMensage = 'O nome não pode conter caracteres especiais';
    } else {
        validNameUser = true
        errorMensage = '';
    }

    exibirErro()
}

var email = '';
var validEmail = false;

function validarEmail() {
    email = iptEmail.value;

    var qtdDigitos = email.length;

    var emailHasArroba = email.includes('@');

    var emailHasAsteris = email.includes('*');
    var emailHasExclama = email.includes('!');
    var emailHasInterrog = email.includes('?');
    var emailHasHashtag = email.includes('#');
    var emailHasCifrao = email.includes('$');
    var emailHasPorcent = email.includes('%');

    if (qtdDigitos > 45) {
        validEmail = false;
        errorMensage = 'O e-mail excede a quantidade de caracteres permitido';
    } else if (emailHasAsteris || emailHasExclama || emailHasInterrog || emailHasCifrao || emailHasPorcent || emailHasHashtag) {
        validEmail = false;
        errorMensage = 'O e-mail não deve conter caracteres especiais';
    } else if (emailHasArroba) {
        validEmail = true;
        errorMensage = '';
    } else {
        validEmail = false;
        errorMensage = 'Insira um endereço de e-mail válido';
    }

    exibirErro()
}

var validTel = false;

function validarTel() {
    var tel = telComercial.value;

    var qtdDigitos = tel.length;

    if (qtdDigitos == 8 || qtdDigitos == 10) {
        validTel = true;
        errorMensage = '';
    } else {
        validTel = false;
        errorMensage = 'Insira um número de telefone válido';
    }

    exibirErro()
}

var password = '';
var validPassword = false

function validarPassword() {
    password = iptPassword.value;

    var qtdDigitos = password.length;
    
    var passwordHasArroba = password.includes('@');
    var passwordHasExclama = password.includes('!');
    var passwordHasInterrog = password.includes('?');
    var passwordHasHashtag = password.includes('#');
    var passwordHasCifrao = password.includes('$');
    var passwordHasPorcent = password.includes('%');
    var passwordHasE = password.includes('&');
    var passwordHasAsteris = password.includes('*');
    var passwordHasPonto = password.includes('.');

    var hasCharEspecial = false; 
    if (passwordHasArroba || passwordHasExclama|| passwordHasInterrog || passwordHasHashtag || passwordHasCifrao || passwordHasPorcent || passwordHasE || passwordHasAsteris|| passwordHasPonto) {
        hasCharEspecial = true
    }

    var passwordHasNumber0 = password.includes('0');
    var passwordHasNumber1 = password.includes('1');
    var passwordHasNumber2 = password.includes('2');
    var passwordHasNumber3 = password.includes('3');
    var passwordHasNumber4 = password.includes('4');
    var passwordHasNumber5 = password.includes('5');
    var passwordHasNumber6 = password.includes('6');
    var passwordHasNumber7 = password.includes('7');
    var passwordHasNumber8 = password.includes('8');
    var passwordHasNumber9 = password.includes('9');
    
    var hasNumber = false;
    if (passwordHasNumber0 || passwordHasNumber1 || passwordHasNumber2 || passwordHasNumber3 || passwordHasNumber4 || passwordHasNumber5 || passwordHasNumber6 || passwordHasNumber7 || passwordHasNumber8 || passwordHasNumber9){
        hasNumber = true;
    }

    var hasUpperCase = password !== password.toLowerCase(); //tem letra minuscula
    var hasLowerCase = password !== password.toUpperCase(); //tem letra maiuscula

    if (qtdDigitos >= 8 && hasCharEspecial && hasNumber && hasUpperCase && hasLowerCase) {
        validPassword = true;
        errorMensage = '';
    } else {
        validPassword = false;
        errorMensage = 'A senha deve conter ao menos 8 caracteres, 1 número e 1 caractere especial, 1 letra maiúscula e 1 minúscula.';
    }
    exibirErro()
}

var confirmed = false;

function confirmPassword() {
    var confirmPassword = ipt_confirmPassword.value;

    
    if (confirmPassword == password) {
        confirmed = true;
        errorMensage = '';
    } else {
        confirmed = false;
        errorMensage = 'Senhas diferentes';
    }

    exibirErro()
}




//validação do login

//validar se os campo nome não está vazio e não passa de 45 dígitos
//validar se a senha possui 8 digitos, 1 caractere especial e um número