# Java Collections

## Collection Interface

A collection represents a group of objects known as its elements.

Interface:

	public interface Collection<E> extends Iterable<E> {
	    // Basic operations
	    int size();
	    boolean isEmpty();
	    boolean contains(Object element);
	    boolean add(E element);         //optional
	    boolean remove(Object element); //optional
	    Iterator<E> iterator();

	    // Bulk operations
	    boolean containsAll(Collection<?> c);
	    boolean addAll(Collection<? extends E> c); //optional
	    boolean removeAll(Collection<?> c);        //optional
	    boolean retainAll(Collection<?> c);        //optional
	    void clear();                              //optional

	    // Array operations
	    Object[] toArray();
	    <T> T[] toArray(T[] a);
	}
	
### Set Interface

* Cannot contain duplicate elements

Interface:

	public interface Set<E> extends Collection<E> {
	    // Basic operations
	    int size();
	    boolean isEmpty();
	    boolean contains(Object element);
	    boolean add(E element);         //optional
	    boolean remove(Object element); //optional
	    Iterator<E> iterator();

	    // Bulk operations
	    boolean containsAll(Collection<?> c);
	    boolean addAll(Collection<? extends E> c); //optional
	    boolean removeAll(Collection<?> c);        //optional
	    boolean retainAll(Collection<?> c);        //optional
	    void clear();                              //optional

	    // Array Operations
	    Object[] toArray();
	    <T> T[] toArray(T[] a);
	}

#### HashSet Class

* stores its elements in a hash table
* the best-performing implementation
* makes no guarantees concerning the order of iteration

##### LinkedHashSet Class

* implemented as a hash table with a linked list running through it
* orders its elements based on the order in which they were inserted into the set (insertion-order)

#### TreeSet Class

* stores its elements in a red-black tree
* orders its elements based on their values
* it is substantially slower than HashSet

#### SortedSet Class

* Maintains its elements in ascending order

### List Interface

* An ordered collection
* Can contain duplicates
* Items accessed by integer index

Interface:

	public interface List<E> extends Collection<E> {
	    // Positional access
	    E get(int index);
	    E set(int index, E element);    //optional
	    boolean add(E element);         //optional
	    void add(int index, E element); //optional
	    E remove(int index);            //optional
	    boolean addAll(int index,
	        Collection<? extends E> c); //optional

	    // Search
	    int indexOf(Object o);
	    int lastIndexOf(Object o);

	    // Iteration
	    ListIterator<E> listIterator();
	    ListIterator<E> listIterator(int index);

	    // Range-view
	    List<E> subList(int from, int to);
	}

#### ArrayList Class

#### LinkedList Class

### Queue

* Holds multiple elements prior to processing
* Ordered (not necessarily insertion orer)

## Map Interface

* Maps keys to values
* Cannot contain duplicate keys

Interface:

	public interface Map<K,V> {
	    // Basic operations
	    V put(K key, V value);
	    V get(Object key);
	    V remove(Object key);
	    boolean containsKey(Object key);
	    boolean containsValue(Object value);
	    int size();
	    boolean isEmpty();

	    // Bulk operations
	    void putAll(Map<? extends K, ? extends V> m);
	    void clear();

	    // Collection Views
	    public Set<K> keySet();
	    public Collection<V> values();
	    public Set<Map.Entry<K,V>> entrySet();

	    // Interface for entrySet elements
	    public interface Entry {
	        K getKey();
	        V getValue();
	        V setValue(V value);
	    }
	}

### HashMap Class

#### LinkedHashMap Class

### SortedMap Interface

#### TreeMap Class


* Maintains its mappings in ascending key order
* Good for dictionaries, directories

## Traversing Collections

### for-each

	for (Object o : collection) {
		// Do Stuff with o
	}

### Iterator

	for (Iterator<?> iterator = collection.iterator(); iterator.hasNext(); ) {
		// Do stuff with 
	}
