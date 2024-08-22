import { ComponentProps } from "react"

interface NavLinkProps extends ComponentProps<'a'>{
    children: String
}

export default function NavLink(props: NavLinkProps){
    return(
        <a {...props} className='font-medium text-sm'>{props.children}</a>
    )
}