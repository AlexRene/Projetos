import { Search, MoreHorizontal, ChevronsLeft, ChevronLeft, ChevronRight, ChevronsRight } from 'lucide-react'
import { IconButton } from '../icon-button/icon-button'
import { Table } from '../table/page';

export default function Attendee(){
    return (
        <div className='flex flex-col gap-4'>
            <div className="flex gap-3 items-center">
                <h1 className="text-2xl font-bold">Participantes</h1>
                <div className="px-3 w-72 py-1.5 border border-white/10 rounded-lg text-sm flex items-center gap-3">
                    <Search className='size-4 text-emerald-300'/>
                    <input className="bg-transparent flex-1 outline-none" type="text" placeholder="Buscar Participante" />
            </div>
        </div>
            
            <Table>
                <thead>
                    <tr className='border-b border-white/10'>
                        <th style={{width: 48}} className='py-3 px-4 text-sm font-semibold text-left'>
                            <input type="checkbox" className='size-4 bg-black/20 rounded border border-white/10 accent-orange-400' />
                        </th>
                        <th className='py-3 px-4 text-sm font-semibold text-left'>Código</th>
                        <th className='py-3 px-4 text-sm font-semibold text-left'>Participante</th>
                        <th className='py-3 px-4 text-sm font-semibold text-left'>Data da inscrição</th>
                        <th className='py-3 px-4 text-sm font-semibold text-left'>Data do check-in</th>
                        <th style={{width: 64}} className='py-3 px-4 text-sm font-semibold text-left'></th>
                    </tr>
                </thead>
                <tbody>
                    {Array.from({length: 5}).map((_,i) => {
                        return(
                            <tr key={i} className='border-b border-white/10 hover:bg-white/5 checked:bg-orange-400'>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>
                            <input type="checkbox" className='size-4 bg-black/20 rounded border border-white/10 accent-orange-400' />
                        </td>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>12383</td>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>
                            <div className='flex flex-col gap-1'>
                                <span className='font-semibold text-white'>
                                    Nome aleatorio
                                </span>
                                <span>Emailaleatorio@gmail.com</span>
                            </div>
                        </td>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>7 days ago</td>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>3 days ago</td>
                        <td className='py-3 px-4 text-sm font-semibold text-zinc-300'>
                            <IconButton>
                                <MoreHorizontal className='size-4'/>
                            </IconButton>
                        </td>
                    </tr>
                        )
                    })}
                </tbody>
                <tfoot>
                    <tr>
                        <td className='py-3 px-4 text-sm text-zinc-300' colSpan={3}>Showing 10 of 228 items</td>
                        <td className='py-3 px-4 text-sm text-zinc-300 text-right' colSpan={3}>
                            <div className='inline-flex items-center gap-8'>
                            <span>Page 1 of 23</span>

                                <div className='flex gap-1.5'>
                                    <IconButton>
                                        <ChevronsLeft className='size-4'/>
                                    </IconButton>

                                    <IconButton>
                                    <ChevronLeft className='size-4'/>
                                    </IconButton>

                                    <IconButton>
                                        <ChevronRight className='size-4'/>
                                    </IconButton>
                                    
                                    <IconButton>
                                        <ChevronsRight className='size-4'/>
                                    </IconButton>
                                </div>
                            </div>    
                        </td>
                    </tr>
                </tfoot>
            </Table>
        </div>
    );
}