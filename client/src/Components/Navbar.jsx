import dp from "../assets/dp.jpeg";
const Navbar = () => {
  const NavbarItem = ({ name }) => {
    return (
      <a
        id={name}
        className=" no-underline p-4   hover:text-white transition-all duration-300 cursor-pointer"
      >
        {name}
      </a>
    );
  };
  return (
    <div className="flex items-center justify-between h-[4rem]  bg-blue-500 min-h-fit px-4">
      <div className="  text-red-500">
        <img src={dp} alt="dp" className="flex rounded-full h-12 w-12 " />
      </div>
      <div>
        {["Home", "Education", "Skills", "Projects"].map((item) => (
          <NavbarItem key={item} name={item} />
        ))}
      </div>
    </div>
  );
};

export default Navbar;
