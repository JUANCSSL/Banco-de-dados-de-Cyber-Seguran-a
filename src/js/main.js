const menu = document.getElementById('menuMobile');
const overlayMenu = document.getElementById('overlayMenu');
function openMenu(){
    menu.style.width = '70%'
    overlayMenu.style.display = 'flex'
};

function closeMenu(){
    menu.style.width = '0%'
    overlayMenu.style.display = 'none'
};

