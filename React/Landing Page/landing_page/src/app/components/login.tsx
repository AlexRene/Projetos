export default function Login(){
    return(
        <div className="flex justify-center mt-32">
            <form action="" className="bg-slate-500 p-10">
            <label className="block">
                <span className="block text-sm font-medium">Username</span>
                <input type="text" className="mt-1 block px-3 py-2 border rounded-md shadow-sm placeholder-slate-100 focus:outline-none focus:ring-1"/>
            </label>

            <label className="block">
                <span className="block text-sm font-medium">Password</span>
                <input type="text" className="block mt-1 rounded-md px-3 py-2"/>
            </label>
            
            <div className="flex justify-center mt-4">
            <button type="button" className="px-3 py-3 rounded bg-gray-400">Cadastrar</button>
            </div>
            

        </form>
        </div>
    );
}