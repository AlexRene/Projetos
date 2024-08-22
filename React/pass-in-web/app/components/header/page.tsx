import Image from 'next/image';
import nlwUniteIcon from '../../assets/nlw-unite-icon.svg'
import NavLink from '../nav-link/page';


export default function Header(){
    return(
        <div className='flex items-center gap-5 py-2'>
            <Image 
            src={nlwUniteIcon}
            alt='Icon of nlw'
            />

            <nav className='flex items-center gap-5'>
                <NavLink>Eventos</NavLink>
                <NavLink>Participantes</NavLink>
            </nav>
        </div>

    );
}