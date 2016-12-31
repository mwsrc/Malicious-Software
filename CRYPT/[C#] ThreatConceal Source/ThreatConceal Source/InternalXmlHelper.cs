using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Xml.Linq;

namespace CybeR_CryptZ.My
{

    [EditorBrowsable(EditorBrowsableState.Never)]
    [DebuggerNonUserCode]
    [CompilerGenerated]
    internal sealed class InternalXmlHelper
    {

        [DebuggerNonUserCode]
        [CompilerGenerated]
        [EditorBrowsable(EditorBrowsableState.Never)]
        private sealed class RemoveNamespaceAttributesClosure
        {

            private readonly List<XAttribute> m_attributes;
            private readonly XNamespace[] m_inScopeNs;
            private readonly string[] m_inScopePrefixes;

            [EditorBrowsable(EditorBrowsableState.Never)]
            internal RemoveNamespaceAttributesClosure(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes)
            {
                m_inScopePrefixes = inScopePrefixes;
                m_inScopeNs = inScopeNs;
                m_attributes = attributes;
            }

            [EditorBrowsable(EditorBrowsableState.Never)]
            internal object ProcessObject(object obj)
            {
                // trial
                return null;
            }

            [EditorBrowsable(EditorBrowsableState.Never)]
            internal XElement ProcessXElement(XElement elem)
            {
                return InternalXmlHelper.RemoveNamespaceAttributes(m_inScopePrefixes, m_inScopeNs, m_attributes, elem);
            }

        } // class RemoveNamespaceAttributesClosure

        [EditorBrowsable(EditorBrowsableState.Never)]
        private InternalXmlHelper()
        {
        }

        [EditorBrowsable(EditorBrowsableState.Never)]
        public static XAttribute CreateAttribute(XName name, object value)
        {
            // trial
            return null;
        }

        [EditorBrowsable(EditorBrowsableState.Never)]
        public static XAttribute CreateNamespaceAttribute(XName name, XNamespace ns)
        {
            XAttribute xattribute1 = new XAttribute(name, ns.NamespaceName);
            xattribute1.AddAnnotation(ns);
            return xattribute1;
        }

        public static string get_AttributeValue(XElement source, XName name)
        {
            // trial
            return null;
        }

        public static string get_AttributeValue(IEnumerable<XElement> source, XName name)
        {
            // trial
            return null;
        }

        public static string get_Value(IEnumerable<XElement> source)
        {
            // trial
            return null;
        }

        [EditorBrowsable(EditorBrowsableState.Never)]
        public static object RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, object obj)
        {
            // trial
            return null;
        }

        [EditorBrowsable(EditorBrowsableState.Never)]
        public static XElement RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, XElement e)
        {
            // trial
            return null;
        }

        [EditorBrowsable(EditorBrowsableState.Never)]
        public static IEnumerable RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, IEnumerable obj)
        {
            IEnumerable ienumerable1;

            bool flag = obj != null;
            if (flag)
            {
                IEnumerable<XElement> ienumerable = obj as IEnumerable<XElement>[];
                flag = ienumerable != null;
                if (flag)
                {
                    return Enumerable.Select<XElement,XElement>(ienumerable, new Func<XElement,XElement>(new InternalXmlHelper.RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes), new InternalXmlHelper.RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes).ProcessXElement));
                }
                else
                {
                    return Enumerable.Select<object,object>(Enumerable.Cast<object>(obj), new Func<object,object>(new InternalXmlHelper.RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes), new InternalXmlHelper.RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes).ProcessObject));
                }
            }
            return obj;
        }

        public static void set_AttributeValue(IEnumerable<XElement> source, XName name, string value)
        {
            // decompiler error
        }

        public static void set_AttributeValue(XElement source, XName name, string value)
        {
            source.SetAttributeValue(name, value);
        }

        public static void set_Value(IEnumerable<XElement> source, string value)
        {
            // decompiler error
        }

    } // class InternalXmlHelper

}

