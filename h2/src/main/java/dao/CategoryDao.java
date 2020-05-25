package dao;

public interface CategoryDao<T1, T2, T3> {
	
	T1 listAll();
	T1 listGu(T2 t);
	T1 list500(T2 t);
	T3 list500Circle(T2 t);
	
}
