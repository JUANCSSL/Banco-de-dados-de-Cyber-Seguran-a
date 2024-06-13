const nameimput = document.getElementById ("name");
const emailimput = document.getElementById ("email");
const departamentimput = document.getElementById ("departament");
const departamenttimput = document.getElementById ("departamentt");
const sendimput = document.getElementById ("send");
const mensagemimput = document.getElementById ("mensagem");
sendimput.onclick = register_incidents;

function register_incidents (ev) {
    ev.preventDefault();
    const incidente_info = { 
        name:nameimput.value,
        email:emailimput.value,
        departament:departamentimput.value,
        departamentt:departamenttimput.value,
        mensagem:mensagemimput.value,
    }
    postApiData(incidente_info)
}





async function postApiData(data) {
    const res = await fetch('http://127.0.0.1:3000/submit', {
      method: "POST",
      body: JSON.stringify(data),
      headers: { "Content-type": "application/json; charset=UTF-8" }
    })
    const json = await res.json();
    console.log(json);
    return json;
  }
 