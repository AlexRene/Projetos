import Attendee from "./components/attendee-list/page";
import Header from "./components/header/page";

export default function App(){
  return(
    <div className="max-w-[1216px] mx-auto py-5 antialiased flex flex-col gap-5">
      <Header />
      <Attendee />
    </div>
    
  );
}