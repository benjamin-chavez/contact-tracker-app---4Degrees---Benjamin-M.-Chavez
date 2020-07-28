const contactList = document.getElementById('contactList');
const contactName = document.getElementById('name');
const contactEmail = document.getElementById('email');
const contactNote = document.getElementById('note');

document.getElementById('addContact').addEventListener('click', addContact);
contactList.addEventListener('click', deleteContact);

// Add Contact
function addContact() {
  const contactRow = document.createElement('div');
  contactRow.className = 'row border-bottom my-1';
  // const data = {
  //   name,
  //   email,
  //   note,
  // };
  contactRow.innerHTML = `
    <div class="col-3 mx-auto text-center">${contactName.value}</div>
    <div class="col-3 mx-auto text-center">${contactEmail.value}</div>
    <div class="col-4 mx-auto text-center">${contactNote.value}</div>
    <div class="col-2 mx-auto text-center">
      <div class="btn btn-sm btn-primary delete-btn align-text-bottom">Delete</div>
    </div>
  `;
  contactList.insertAdjacentElement('beforeend', contactRow);
  clearInputs();
}

// Delete Contact
function deleteContact(e) {
  if (e.target.classList.contains('delete-btn')) {
    const rowToDelete = e.target.parentNode.parentNode;

    rowToDelete.remove();
  }
}

function clearInputs() {
  contactName.value = '';
  contactEmail.value = '';
  contactNote.value = '';
}

async function getContacts(url) {
  const response = await fetch(url);

  const responseData = await response.json();
  console.log('test');
  return responseData;
}

function testGet() {
  getContacts('http://localhost:5000/home')
    .then((data) => console.log(data))
    .catch((err) => console.log(err));
}

testGet();
